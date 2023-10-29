import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),
      height: 200.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "English",
                style: GoogleFonts.exo(
                    fontSize: 21.sp, fontWeight: FontWeight.w200),
              ),
              Visibility(
                visible: true,
                child: Icon(
                  Icons.check,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Arabic",
                style: GoogleFonts.exo(
                    fontSize: 21.sp, fontWeight: FontWeight.w200),
              ),
              Visibility(
                visible: true,
                child: Icon(
                  Icons.check,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
