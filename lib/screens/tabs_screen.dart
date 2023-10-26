import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/screens/%20widget/tab_widget.dart';

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
              ))
        ],
      ),
    );
  }
}
