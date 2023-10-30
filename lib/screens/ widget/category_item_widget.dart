import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/category_model.dart';

class CategoryItemWidget extends StatefulWidget {
  CategoryModel categoryModel;

  CategoryItemWidget(this.categoryModel, {super.key});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.categoryModel.color,
          borderRadius: BorderRadius.circular(12.r)),
      margin: REdgeInsets.symmetric(horizontal: 10),
      height: 140.h,
      child: Column(children: [
        SizedBox(height: 10.h),
        Image.asset(
          widget.categoryModel.img,
          height: 100.h,
          fit: BoxFit.fill,
        ),
        Spacer(),
        Text(
          getCategoryName(widget.categoryModel),
          style: TextStyle(fontSize: 18.5.sp, color: Colors.white),
        ),
        SizedBox(
          height: 7.h,
        )
      ]),
    );
  }

  String getCategoryName(CategoryModel categoryModel) {
    if (categoryModel.name == "Sports") {
      return AppLocalizations.of(context)!.sports;
    }
    if (categoryModel.name == "Politics") {
      return AppLocalizations.of(context)!.politics;
    }
    if (categoryModel.name == "Business") {
      return AppLocalizations.of(context)!.business;
    }
    if (categoryModel.name == "Health") {
      return AppLocalizations.of(context)!.health;
    }
    if (categoryModel.name == "Entertainment") {
      return AppLocalizations.of(context)!.entertainment;
    }
    if (categoryModel.name == "Science") {
      return AppLocalizations.of(context)!.science;
    }
    return "";
  }
}
