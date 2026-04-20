import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/constants/app_strings.dart';
import 'package:simple_ecommerce/widgets/cattegory_item.dart';

class BuildListCategories extends StatelessWidget {
  const BuildListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: AppStrings.categories.length,
      itemBuilder: (context, index) =>
          CattegoryItem(title: AppStrings.categories[index]),
    );
  }
}
