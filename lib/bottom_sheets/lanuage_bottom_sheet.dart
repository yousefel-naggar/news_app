import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/shared/styles/colors.dart';
import 'package:provider/provider.dart';

import '../providers/mu_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      padding: REdgeInsets.all(16),
      height: 200.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              pro.changeLanguage("en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "English",
                  style: GoogleFonts.exo(
                      fontSize: 21.sp,
                      color:
                          pro.local == "en" ? ColorsData.green : Colors.black,
                      fontWeight: FontWeight.w200),
                ),
                Visibility(
                  visible: pro.local == "en" ? true : false,
                  child: Icon(
                    color: ColorsData.green,
                    Icons.check,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              pro.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pro.local == "ar" ? "عر بي" : "Arabic",
                  style: GoogleFonts.exo(
                      fontSize: 21.sp,
                      color:
                          pro.local == "ar" ? ColorsData.green : Colors.black,
                      fontWeight: FontWeight.w200),
                ),
                Visibility(
                  visible: pro.local == "ar" ? true : false,
                  child: Icon(
                    color: ColorsData.green,
                    Icons.check,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
