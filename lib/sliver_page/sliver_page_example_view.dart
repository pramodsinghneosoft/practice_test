import 'package:flutter/material.dart';

class SliverPageView extends StatefulWidget {
  @override
  _SliverPageViewState createState() => _SliverPageViewState();
}

class _SliverPageViewState extends State<SliverPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Sliver View")),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          title: Text("Sliver View"),
        ),
        SliverToBoxAdapter(
            child: Container(
                height: 200, child: Center(child: Text("Content here")))),
        SliverList(delegate: new SliverChildListDelegate(_buildList(5))),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return buildQueueCard(items[index], index);
          }, childCount: items.length),
        ),
      ]),
    );
  }

  List _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text('Item ${i.toString()}',
              style: new TextStyle(fontSize: 25.0))));
    }

    return listItems;
  }

  Widget buildQueueCard(QueueItems queueItems, int index) {
    return InkWell(
      onTap: () {},
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // color: Color(0x66ffffff),
          color: Colors.white70,
          elevation: 2,
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Icon(
                    queueItems.icon,
                    size: 90.0,
                  )),
                  Text(
                    queueItems.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ]),
          )),
    );
  }
}

List<QueueItems> items = [
  const QueueItems(title: "Staff", icon: Icons.people),
  const QueueItems(title: "Upcoming", icon: Icons.payment),
  const QueueItems(title: "History", icon: Icons.history),
  const QueueItems(title: "Scan", icon: Icons.scanner),
];

class QueueItems {
  const QueueItems({this.title, this.icon});

  final String title;

  final IconData icon;
}
