import 'package:flutter/material.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "HomeLayout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
