import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/shared/styles/colors.dart';

class TabWidget extends StatelessWidget {
  String sourceName;
  bool isSelected;

  TabWidget(this.sourceName, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 6),
      padding: REdgeInsets.symmetric(horizontal: 8, vertical: 7),
      decoration: BoxDecoration(
          color: isSelected?ColorsData.green:Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: ColorsData.green,width: 2)),
      child: Text(
        sourceName,
        style: TextStyle(color: isSelected?Colors.white:ColorsData.green),
      ),
    );
  }
}
