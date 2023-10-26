import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/shared/styles/colors.dart';

import '../../models/NewsResponse.dart';

class NewsWidget extends StatelessWidget {
  Articles article;

  NewsWidget(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        //color: Colors.red,
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                height: 200.h,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator(color: ColorsData.green,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text("${article.source?.name} *" ?? "",
                style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
            SizedBox(
              height: 6.h,
            ),
            Text(
              article.title ?? "",
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(article.publishedAt?.substring(0,10) ?? "",
                style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }
}
