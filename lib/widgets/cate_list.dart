import 'package:flutter/material.dart';
import 'dart:io';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter_store/widgets/card.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}

typedef void CategoryClick(String index);



class CategoryList extends StatelessWidget {
  final CategoryClick handler;

  CategoryList({this.handler});

  static List cateList = [
    {'name': '爱情鲜花', 'imgUrl':'https://img01.hua.com/uploadpic/newpic/9012038.jpg_220x240.jpg','id':'1'},
    {'name': '长辈鲜花', 'imgUrl':'https://img01.hua.com/uploadpic/newpic/9012092.jpg_220x240.jpg','id':'2'},
    {'name': '永生花', 'imgUrl':'https://img01.hua.com/uploadpic/newpic/1073211.jpg_220x240.jpg','id':'3'},
    {'name': '蛋糕', 'imgUrl':'https://img01.hua.com/uploadpic/newpic/1207010.jpg_220x240.jpg','id':'4'},
    {'name': '礼品', 'imgUrl':'https://img01.hua.com/uploadpic/newpic/1060030.jpg_220x240.jpg','id':'5'},
  ];



  list(that) {
    return cateList.map((item){
      return GestureDetector(
        onTap: (){
          if(that.handler != null) that.handler(item['id']);
        },
        child: CardBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: item['imgUrl'],
                height: 100,
                width: 100,
              ),
              Container(
                height: 40,
                padding: EdgeInsets.only(top: 10),
                child: Text(item['name'],textScaleFactor:1.2),
              ),
            ],
          ),
        )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: list(this)
        ),
      ),
    );
  }
}
