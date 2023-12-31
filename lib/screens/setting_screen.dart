import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../bottom_sheets/lanuage_bottom_sheet.dart';
import '../providers/mu_provider.dart';
import '../shared/styles/colors.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "SettingScreen";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/background_app.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22.r),
                  bottomRight: Radius.circular(22.r))),
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorsData.green,
          title: Text(
            AppLocalizations.of(context)!.settings,
            style: GoogleFonts.exo(
              fontSize: 20.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: Container(
          child: Padding(
            padding: REdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.lang,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 12.h,
                ),
                InkWell(
                  onTap: () {
                    showLanguageBottomSheet(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: ColorsData.green, width: 1.4.w)),
                    margin: REdgeInsets.symmetric(horizontal: 17),
                    padding:
                    REdgeInsets.symmetric(vertical: 10, horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pro.local == "en" ? "English" : "عربي",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: ColorsData.green),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 30.r,
                          color: ColorsData.green,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showLanguageBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    builder: (context) => LanguageBottomSheet(),
    context: context,
  );
}
