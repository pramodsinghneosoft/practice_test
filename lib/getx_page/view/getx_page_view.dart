import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_test/getx_page/controller/controller_view.dart';

class GetXPageView extends StatelessWidget {
  final userController = Get.put(UserController());
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data View"),
      ),
      body: Container(
        child: GetX<UserController>(
          builder: (controller) {
            return ListView.builder(
                itemCount: controller.userList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: InkWell(
                        onTap: () {},
                        child: Text(controller.userList[index].name)),
                  );
                });
          },
        ),
      ),
    );
  }
}
