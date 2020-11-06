import 'package:flutter/material.dart';

class HeroTagPageView extends StatefulWidget {
  @override
  _HeroTagPageViewState createState() => _HeroTagPageViewState();
}

class _HeroTagPageViewState extends State<HeroTagPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HeroTag Page")),
        body: _buildDemoWidget(context));
  }

  Widget _buildDemoWidget(context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          ListTile(
            leading: GestureDetector(
              child: Hero(
                tag: "tag",
                child: _buildIcon(),
              ),
              onTap: () {
                _getDetailPage();
              },
            ),
          )
        ],
      ),
    );
  }

  void _getDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text("Detail Page")),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "tag",
                      child: _buildWidget(),
                    ),
                    Text('hello'),
                  ],
                ),
              ),
            )));
  }

  Widget _buildIcon() {
    return Container(
      height: 50,
      width: 50,
      color: Colors.blue,
    );
  }

  Widget _buildWidget() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
    );
  }
}
