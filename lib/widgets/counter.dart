import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final VoidCallback up;
  final VoidCallback down;
  final double iconSize;
  final num count;
  final double height;
  final EdgeInsets padding = EdgeInsets.all(0);
  final Color gray = Color.fromRGBO(244, 244, 244, 1);
  final double buttonWidth = 40;

  Counter({this.up, this.down, this.count, this.iconSize = 18,this.height = 40});

  Widget button(VoidCallback onTap, IconData icon){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        color: gray,
        child: Icon(icon, size: iconSize),
      ),
    );
  }

  Widget counterLabel(){
    return Container(
      alignment: Alignment.center,
      decoration:BoxDecoration(
        border: Border.all(color: gray),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 40),
        child: Text(count.toString(),textAlign: TextAlign.center),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          button(down, Icons.remove),
          counterLabel(),
          button(up, Icons.add),
        ],
      ),
    );
  }
}