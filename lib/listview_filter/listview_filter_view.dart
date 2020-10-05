import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite_test/listview_filter/listviewmodel.dart';
import 'package:sqflite_test/listview_filter/service.dart';

class FilterListviewView extends StatefulWidget {
  @override
  _FilterListviewViewState createState() => _FilterListviewViewState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback callback;
  Timer _timer;
  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _FilterListviewViewState extends State<FilterListviewView> {
  List<ListViewFilterModel> listMain = [];
  final debouncer = Debouncer(milliseconds: 1000);
  bool isSearching = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() {
    ServiceCall.getData().then((valueList) {
      if (valueList != null) {
        if (valueList.length > 0) {
          setState(() {
            listMain = valueList;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ? searchTextField() : Text("Search View"),
        centerTitle: true,
        actions: [
          isSearching
              ? Text("")
              : Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isSearching = true;
                        });
                      },
                      child: Icon(Icons.search)),
                ),
          isSearching
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                      onTap: () {
                        ServiceCall.getData().then((valueList) {
                          setState(() {
                            listMain = filterList(valueList, "");
                          });
                        });
                        setState(() {
                          isSearching = false;
                        });
                      },
                      child: Icon(Icons.cancel)),
                )
              : Text(""),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // searchTextField(),
            SizedBox(height: 20),
            getLength() != 0
                ? list()
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
          itemCount: getLength(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildcardwidget(index),
            );
          }),
    );
  }

  Card _buildcardwidget(int index) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(listMain[index].name),
          SizedBox(height: 20),
          Text(listMain[index].email),
        ],
      ),
    ));
  }

  int getLength() {
    if (listMain != null) {
      if (listMain.length != 0) {
        return listMain.length;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            filled: true,
            fillColor: Colors.white60,
            contentPadding: EdgeInsets.all(15.0),
            hintText: "Filter by name or email"),
        onChanged: (value) {
          debouncer.run(() {
            ServiceCall.getData().then((valueList) {
              setState(() {
                listMain = filterList(valueList, value);
              });
            });
          });
        },
      ),
    );
  }

  List<ListViewFilterModel> filterList(
      List<ListViewFilterModel> listSearch, String filterString) {
    List<ListViewFilterModel> list = listSearch
        .where((element) =>
            element.name.toLowerCase().contains(filterString.toLowerCase()) ||
            element.email.toLowerCase().contains(filterString.toLowerCase()))
        .toList();
    return list;
  }
}
