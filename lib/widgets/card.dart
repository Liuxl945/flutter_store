import 'package:flutter/material.dart';

const boxDecoration = BoxDecoration(
  color: Color.fromRGBO(255, 255, 255, 1),
  borderRadius: BorderRadius.all(Radius.circular(6)),
  boxShadow: [
    BoxShadow(
      blurRadius: 6,
      color: Color.fromRGBO(233, 233, 233, 0.4),
      offset: Offset(1, 0),
      spreadRadius: 0,
    ),
  ],
);


class CardBox extends StatelessWidget {
  final Widget child;
  final double height;
  final double margin;
  CardBox({this.child, this.height = 120,this.margin = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        height: height,
        decoration: boxDecoration,
        child: child
    );
  }
}