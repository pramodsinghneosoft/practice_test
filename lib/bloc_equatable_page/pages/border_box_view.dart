import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;

  const BorderBox({Key key, this.padding, this.width, this.height, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withAlpha(40), width: 2),
        ),
        padding: padding ?? EdgeInsets.all(8),
        child: Center(child: child));
  }
}
