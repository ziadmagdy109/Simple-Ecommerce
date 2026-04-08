import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/logic/cubit/accessories_cubit.dart';
import 'package:ecommerce/logic/riverpod/products_provider.dart';
import 'package:ecommerce/widget/accessories_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  late List<Accessories> allAccessories = [];

  @override
  // void initState() {
  //   super.initState();
  //   allAccessories = BlocProvider.of<AccessoriesCubit>(
  //     context,
  //   ).getAllProducts();
  // }
  // Widget blocBuildWidget() {
  //   return BlocBuilder<AccessoriesCubit, AccessoriesState>(
  //     builder: (context, state) {
  //       if (state is AccessoriesLoaded) {
  //         allAccessories = (state).allAccessories;
  //         return buildLoadedList();
  //       } else {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //     },
  //   );
  // }
  // Widget buildLoadedList() {
  //   return SingleChildScrollView(
  //     child: Container(
  //       color: Colors.grey,
  //       child: Column(children: [buildAccessoriesGrid()]),
  //     ),
  //   );
  // }
  // Widget buildAccessoriesGrid() {
  //   return GridView.builder(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       childAspectRatio: 2 / 3,
  //       mainAxisSpacing: 1,
  //       crossAxisSpacing: 1,
  //     ),
  //     shrinkWrap: true,
  //     physics: const ClampingScrollPhysics(),
  //     itemCount: allAccessories.length,
  //     itemBuilder: (context, index) {
  //       return AccessoriesItem(accessories: allAccessories[index]);
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: products.when(
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
      ),
    );
  }
}
