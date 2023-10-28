import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category_screen.dart';
import 'package:news/screens/setting_screen.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:news/shared/styles/colors.dart';

import '../screens/show_drawer.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ShowDrawer(sclectedScreen),
      ),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22.r),
                bottomRight: Radius.circular(22.r))),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorsData.green,
        title: Text(
          category?.name ?? "News App",
          style: GoogleFonts.exo(),
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getSources(category?.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("somthing wrong"),
            );
          }
          var source = snapshot.data?.sources ?? [];
          return category == null
              ? CategoryScreen(getSelectedCategory)
              : TabsScreen(source);
        },
      ),
    );
  }

  CategoryModel? category;

  void sclectedScreen(num) {
    if (num == 1) {
      category = null;
      setState(() {
        Navigator.pop(context);
      });
    } else if (num == 2) {
      Navigator.pushNamed(context, SettingScreen.routeName);
    }
  }

  void getSelectedCategory(cat) {
    category = cat;
    setState(() {});
  }
}
