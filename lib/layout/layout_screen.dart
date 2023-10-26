import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:news/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "HomeLayout";

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
        title: Text("News app"),
      ),
      body: FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("somthing wrong"),
            );
          }
          var source = snapshot.data?.sources ?? [];
          return TabsScreen(source);
        },
      ),
    );
  }
}
