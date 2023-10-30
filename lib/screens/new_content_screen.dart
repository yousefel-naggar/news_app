import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/NewsResponse.dart';
import '../shared/styles/colors.dart';

class NewContentScreen extends StatelessWidget {
  static const String routeName = "NewContentScreen";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Articles;
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
          AppLocalizations.of(context)!.newContent,
          style: GoogleFonts.exo(),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage ?? "",
                height: 200.h,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: ColorsData.green,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text("${args.source?.name} *" ?? "",
                style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
            SizedBox(
              height: 6.h,
            ),
            Text(
              args.title ?? "",
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'by " ${args.author} "',
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              args.publishedAt ?? "",
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              args.content ?? "",
              style: GoogleFonts.poppins(
                  fontSize: 16.sp, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
