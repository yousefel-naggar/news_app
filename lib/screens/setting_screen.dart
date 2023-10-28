import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/styles/colors.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = "SettingScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22.r),
                bottomRight: Radius.circular(22.r))),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorsData.green,
        title: Text(
          "Settings",
          style: GoogleFonts.exo(
            fontSize: 20.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
