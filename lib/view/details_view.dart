import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/widget/build_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final Accessories accessories;

  const DetailsView({super.key, required this.accessories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(slivers: [buildSliverAppBar(accessories)]),
    );
  }
}
