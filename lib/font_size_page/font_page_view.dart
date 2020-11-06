import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/dark_theme_page/dark_theme_page_view.dart';
import 'package:sqflite_test/factory_key_page/factory_view_page.dart';
import 'package:sqflite_test/font_size_page/fontPageView.dart';
import 'package:sqflite_test/font_size_page/font_size_model.dart';
import 'package:sqflite_test/font_size_page/shared_preference_view.dart';
import 'package:sqflite_test/generator_page/generator_page.dart';
import 'package:sqflite_test/hero_tag_page/hero_tag_page_view.dart';
import 'package:sqflite_test/hive_page/hive_page_view.dart';
import 'package:sqflite_test/provider_files/provider_types/future_provider_page.dart';
import 'package:sqflite_test/proxy_providers_page/proxy_providers_page.dart';
import 'package:sqflite_test/sqlite_page/employee_page_view.dart';

class FontSizePageView extends StatefulWidget {
  @override
  _FontSizePageViewState createState() => _FontSizePageViewState();
}

class _FontSizePageViewState extends State<FontSizePageView> {
  Item _items;
  double fontSizeValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Size View"),
        actions: [
          FlatButton(
              onPressed: () {
                // Provider.of<FontModel>(context, listen: false)
                //     .changeFontSize(20);
                Get.to(FontViewPage());
              },
              child: Icon(Icons.font_download)),
          FlatButton(
              onPressed: () {
                Get.to(DarkThemeView());
              },
              child: Icon(Icons.swap_vert_circle)),
          FlatButton(
              onPressed: () {
                // Get.to(ProxyProviderPage());
                Get.to(ProviderPageTypes());
              },
              child: Icon(Icons.circle)),
        ],
      ),
      body: Container(
        child: Consumer<FontModel>(builder: (context, data, child) {
          return InkWell(
              onTap: () {
                // Get.to(FontViewPage());
              },
              child: Column(
                children: [
                  Text(data.fontSize.toString()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 20),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      hint: Text("Select Value"),
                      value: _items,
                      items: listItems.map((list) {
                        return DropdownMenuItem(
                          child: Text(list.fontSizeTitle),
                          value: list,
                        );
                      }).toList(),
                      onChanged: (value) {
                        print(value.fontSizeTitle);
                        print(int.parse(value.fontSizeTitle));
                        SharedPreferenceView.saveInt(
                            "key", int.parse(value.fontSizeTitle));
                        setState(() {
                          fontSizeValue = double.parse(value.fontSizeTitle);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 80),
                  Text(
                    "Data value",
                    style:
                        TextStyle(fontSize: fontSizeValue, color: Colors.black),
                  ),
                  SizedBox(height: 80),
                  _fractionalSizedBoxWidget(),
                  FlatButton(
                      onPressed: () {
                        Get.to(EmployeePageView());
                      },
                      child: Text("Next page")),
                  FlatButton(
                    child: Text("Next Page 2"),
                    onPressed: () {
                      Get.to(HeroTagPageView());
                    },
                  ),
                  FlatButton(
                    child: Text("Next Page 3"),
                    onPressed: () {
                      // Get.to(FactoryPage());
                      // Get.to(HivePage());
                      Get.to(GeneratorPage());
                    },
                  ),
                ],
              ));
        }),
      ),
    );
  }

  Widget _fractionalSizedBoxWidget() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedWidget(widthFactor: 0.4),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedWidget(widthFactor: 0.6),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedWidget(widthFactor: 0.8),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedWidget(widthFactor: 1.0),
          ],
        ),
      ],
    );
  }
}

class FractionallySizedWidget extends StatelessWidget {
  final double widthFactor;
  FractionallySizedWidget({@required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: widthFactor,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${widthFactor * 100}%',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

List<Item> listItems = [
  Item(id: 1, fontSizeTitle: "24"),
  Item(id: 2, fontSizeTitle: "32"),
  Item(id: 3, fontSizeTitle: "38"),
];

class Item {
  final int id;
  final String fontSizeTitle;

  Item({this.id, this.fontSizeTitle});
}
