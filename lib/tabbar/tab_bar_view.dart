import 'package:flutter/material.dart';

class TabbarView extends StatefulWidget {
  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            Container(
              color: Colors.yellow,
            ),
            new Container(
              color: Colors.orange,
            ),
            new Container(
              color: Colors.lightGreen,
            ),
            new Container(
              color: Colors.red,
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: new Icon(Icons.rss_feed),
            ),
            Tab(
              icon: new Icon(Icons.perm_identity),
            ),
            Tab(
              icon: new Icon(Icons.settings),
            ),
          ],
          onTap: (index) {},
          labelColor: Colors.yellow,
          // isScrollable: true,
          unselectedLabelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}
