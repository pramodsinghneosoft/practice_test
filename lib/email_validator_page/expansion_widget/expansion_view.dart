import 'package:flutter/material.dart';

class ExpansionWidgetView extends StatefulWidget {
  @override
  _ExpansionWidgetViewState createState() => _ExpansionWidgetViewState();
}

class _ExpansionWidgetViewState extends State<ExpansionWidgetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expansion View")),
      body: Container(
          child: ListView.builder(
              itemCount: prepareData.length,
              itemBuilder: (context, index) {
                return ExpansionPanelList(
                  animationDuration: Duration(seconds: 1),
                  children: [
                    ExpansionPanel(
                      body: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'PRICE: ${prepareData[index].bodyModel.price}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'QUANTITY: ${prepareData[index].bodyModel.quantity}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      headerBuilder: (context, isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            prepareData[index].header,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        );
                      },
                      isExpanded: prepareData[index].isExpanded,
                    )
                  ],
                  expansionCallback: (int item, bool status) {
                    setState(() {
                      prepareData[index].isExpanded =
                          !prepareData[index].isExpanded;
                    });
                  },
                );
              })),
    );
  }
}

List<ItemModel> prepareData = <ItemModel>[
  ItemModel(header: 'Milk', bodyModel: BodyModel(price: 20, quantity: 10)),
  ItemModel(header: 'Coconut', bodyModel: BodyModel(price: 35, quantity: 5)),
  ItemModel(header: 'Watch', bodyModel: BodyModel(price: 800, quantity: 15)),
  ItemModel(header: 'Cup', bodyModel: BodyModel(price: 80, quantity: 150))
];

class ItemModel {
  bool isExpanded;
  String header;
  BodyModel bodyModel;

  ItemModel({this.isExpanded: false, this.header, this.bodyModel});
}

class BodyModel {
  int price;
  int quantity;

  BodyModel({this.price, this.quantity});
}
