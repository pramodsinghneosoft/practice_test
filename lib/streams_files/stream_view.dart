import 'package:flutter/material.dart';
import 'package:sqflite_test/streams_files/contact_manager.dart';

class StreamdataView extends StatefulWidget {
  @override
  _StreamdataViewState createState() => _StreamdataViewState();
}

class _StreamdataViewState extends State<StreamdataView> {
  ContactManager contactManager = ContactManager();
  List<String> contacts = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Stream Using contact"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Chip(
                  label: StreamBuilder<int>(
                      stream: contactManager.contactCounter,
                      builder: (context, snapshot) {
                        return Text((snapshot.data ?? 0).toString());
                      })),
            )
          ],
        ),
        body: StreamBuilder<List<String>>(
            stream: contactManager.contactlistNow,
            builder: (context, snapshot) {
              contacts = snapshot.data;
              return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text(contacts[index]));
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: getLength());
            }),
      ),
      length: 2,
    );
  }

  int getLength() {
    if (contacts != null) {
      if (contacts.length != 0) {
        return contacts.length;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }
}
