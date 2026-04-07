import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/logic/cubit/accessories_cubit.dart';
import 'package:ecommerce/widget/accessories_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Accessories> allAccessories = [];

  @override
  void initState() {
    super.initState();
    allAccessories = BlocProvider.of<AccessoriesCubit>(
      context,
    ).getAllProducts();
  }

  Widget blocBuildWidget() {
    return BlocBuilder<AccessoriesCubit, AccessoriesState>(
      builder: (context, state) {
        if (state is AccessoriesLoaded) {
          allAccessories = (state).allAccessories;
          return buildLoadedList();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildLoadedList() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(children: [buildAccessoriesGrid()]),
      ),
    );
  }

  Widget buildAccessoriesGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: allAccessories.length,
      itemBuilder: (context, index) {
        return AccessoriesItem(accessories: allAccessories[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: blocBuildWidget(),
    );
  }
}
