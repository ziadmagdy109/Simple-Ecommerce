import 'package:ecommerce/config/routing/app_routes.dart';
import 'package:ecommerce/data/model/accessories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccessoriesItem extends StatelessWidget {
  const AccessoriesItem({super.key, required this.accessories});
  final Accessories accessories;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => context.push(AppRoutes.detailsView, extra: accessories),
        child: GridTile(
          footer: Hero(
            tag: accessories.id,
            child: Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${accessories.title}",
                      style: TextStyle(
                        height: 1.3.h,
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    "\$${accessories.price}",
                    style: TextStyle(
                      height: 1.3.h,
                      fontSize: 16.sp,
                      color: Colors.white,
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
              color: Colors.white60,
              borderRadius: BorderRadius.circular(16),
            ),

            child: accessories.thumbnail.isNotEmpty
                ? FadeInImage.assetNetwork(
                    height: double.infinity,
                    width: double.infinity,
                    placeholder: "assets/images/Trail loading.gif",
                    image: accessories.thumbnail,
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
