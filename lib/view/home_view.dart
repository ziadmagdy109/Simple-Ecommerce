import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/logic/riverpod/products_provider.dart';
import 'package:ecommerce/widget/accessories_item.dart';
import 'package:ecommerce/widget/widget_offline_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomeView extends ConsumerWidget {
  late List<Accessories> allAccessories = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: StreamBuilder<InternetStatus>(
        stream: InternetConnection().onStatusChange,
        builder: (context, snapshot) {
          final status = snapshot.data;
          if (status == InternetStatus.disconnected) {
            return const WidgetOfflineNetwork();
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return products.when(
            data: (data) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return AccessoriesItem(accessories: data[index]);
              },
            ),
            error: (error, stackTrace) => Center(child: Text("Error")),
            loading: () => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
