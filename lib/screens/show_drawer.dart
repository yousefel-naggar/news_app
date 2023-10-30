import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/shared/styles/colors.dart';

class ShowDrawer extends StatelessWidget {
  Function selectedTab;

  static const int category = 1;
  static const int settings = 2;

  ShowDrawer(this.selectedTab, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: ColorsData.green,
        ),
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.appName,
            style: GoogleFonts.poppins(
                fontSize: 23.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      ListTile(
        onTap: () {
          selectedTab(category);
        },
        minLeadingWidth: 3.w,
        leading: const Icon(
          Icons.list,
          color: Color(0xFF303030),
        ),
        title: Text(
          AppLocalizations.of(context)!.categories,
          style: GoogleFonts.poppins(
              fontSize: 15.sp,
              color: const Color(0xFF303030),
              fontWeight: FontWeight.bold),
        ),
      ),
      ListTile(
        onTap: () {
          selectedTab(settings);
        },
        minLeadingWidth: 3.w,
        leading: const Icon(
          Icons.settings,
          color: Color(0xFF303030),
        ),
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: GoogleFonts.poppins(
              fontSize: 15.sp,
              color: const Color(0xFF303030),
              fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
