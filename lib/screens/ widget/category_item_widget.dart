import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryItemWidget(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.circular(12.r)),
      margin: REdgeInsets.symmetric(horizontal: 10),
      height: 140.h,
      child: Column(children: [
        SizedBox(height: 10.h),
        Image.asset(
          categoryModel.img,
          height: 100.h,
          fit: BoxFit.fill,
        ),
        Spacer(),
        Text(
          categoryModel.name,
          style: TextStyle(fontSize: 17.5.sp, color: Colors.white),
        ),
        SizedBox(
          height: 7.h,
        )
      ]),
    );
  }
}
