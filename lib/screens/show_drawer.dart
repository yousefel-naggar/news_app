import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/shared/styles/colors.dart';

class ShowDrawer extends StatelessWidget {
  const ShowDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: ColorsData.green,
        ),
        child: Center(
          child: Text(
            "News App",
            style: GoogleFonts.poppins(
                fontSize: 23.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      ListTile(
        minLeadingWidth: 3.w,
        leading: Icon(
          Icons.list,
          color: Color(0xFF303030),
        ),
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
              fontSize: 15.sp,
              color: Color(0xFF303030),
              fontWeight: FontWeight.bold),
        ),
      ),
      ListTile(
        minLeadingWidth: 3.w,
        leading: Icon(
          Icons.settings,
          color: Color(0xFF303030),
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
              fontSize: 15.sp,
              color: Color(0xFF303030),
              fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
