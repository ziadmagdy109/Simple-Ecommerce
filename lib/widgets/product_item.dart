import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ecommerce/core/constants/app_colors.dart';
import 'package:simple_ecommerce/core/router/app_routes.dart';
import 'package:simple_ecommerce/data/model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => context.push(AppRoutes.detailsView, extra: product),
        child: GridTile(
          footer: Hero(
            tag: product.id,
            child: Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              color: AppColors.background,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "product.title",
                      style: TextStyle(
                        height: 1.3.h,
                        fontSize: 13.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      height: 1.3.h,
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(16),
            ),

            child: product.thumbnail.isNotEmpty
                ? FadeInImage.assetNetwork(
                    height: double.infinity,
                    width: double.infinity,
                    placeholder: "assets/images/Trail loading.gif",
                    image: product.thumbnail,
                  )
                : Image.asset(
                    "assets/images/batman-silhouette-5120x2880-18270.jpg",
                  ),
          ),
        ),
      ),
    );
  }
}
