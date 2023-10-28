import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/screens/%20widget/news_widget.dart';
import 'package:news/screens/%20widget/tab_widget.dart';
import 'package:news/screens/new_content_screen.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class TabsScreen extends StatefulWidget {
  List<Sources> source;

  TabsScreen(this.source, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
              length: widget.source.length,
              child: TabBar(
                isScrollable: true,
                onTap: (value) {
                  _currentIndex = value;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                tabs: widget.source
                    .map(
                      (e) => TabWidget(e.name ?? "",
                          widget.source.indexOf(e) == _currentIndex),
                    )
                    .toList(),
              )),
          FutureBuilder(
            future: ApiManager.getNews(widget.source[_currentIndex].id ?? ""),
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
              var data = snapshot.data?.articles ?? [];
              return Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, NewContentScreen.routeName,arguments: data[index]);
                    },
                    child: NewsWidget(data[index]),
                  );
                },
                itemCount: data.length,
              ));
            },
          ),
        ],
      ),
    );
  }
}
