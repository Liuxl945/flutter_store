import 'package:flutter/material.dart';
import 'package:flutter_store/widgets/counter.dart';

class OverLayer extends StatefulWidget {
  OverLayer({Key key}) : super(key: key);

  _OverLayerState createState() => _OverLayerState();
}

class _OverLayerState extends State<OverLayer> {

  void close() {
    Navigator.of(context).pop();
  }

  Widget list(){
    List <Widget> categorysList = [];

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text("选择您想要的类型:", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ]..addAll(categorysList),
        ),
      ),
    );
  }

  Widget counter(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("购买数量", style: TextStyle(fontSize: 14)),
          Counter(
            up:(){

            },
            down:(){

            },
            count:1
          ),
        ],
      ),
    );
  }

  Widget navButton(){
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        color: Colors.deepOrange,
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child: Text('确认',style:TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: close,
            child: ConstrainedBox(constraints: BoxConstraints(),),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height / 2 - 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                child: Column(
                  children: <Widget>[
                    list(),
                    counter(),
                    navButton(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
