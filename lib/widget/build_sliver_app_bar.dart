import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildSliverAppBar(dynamic accessories) {
  return SliverAppBar(
    expandedHeight: 400,
    pinned: true,
    stretch: true,
    backgroundColor: Colors.grey,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      title: Row(
        children: [
          Expanded(
            child: Text(
              accessories.title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '\$${accessories.price}',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      background: Hero(
        tag: accessories.id,
        child: Image.network(accessories.thumbnail, fit: BoxFit.cover),
      ),
    ),
  );
}
