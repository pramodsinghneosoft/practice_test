import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:sqflite_test/main.dart';
import 'package:sqflite_test/riverpod_page/user_data/river_user_model.dart';

class RiverUserView extends HookWidget {
  List<RiverUserModel> list1 = [];
  @override
  Widget build(BuildContext context) {
    final userModel = useProvider(providerUser.state);

    return Scaffold(
      appBar: AppBar(title: Text("User View")),
      body: FutureBuilder<List<RiverUserModel>>(
        future: context.read(providerUser).getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            List<RiverUserModel> model = snapshot.data;
            return Text("${model[0].name}");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  void getData(context) async {
    context.read(providerUser).getData();
  }
}
