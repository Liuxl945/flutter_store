
import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_store/widgets/back_nav.dart';
import 'package:flutter_store/widgets/card.dart';
import 'package:flutter_store/widgets/title.dart';

final couponPage = () => BodyPage.formBuild((ctx, params, router) {

  var coupons = (String title, num price, String timeEnd, String desc){
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: CardBox(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(title, textScaleFactor: 1.4, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(desc, textScaleFactor: 1.1),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(timeEnd,textScaleFactor: 0.9),
                    ),
                    SizedBox(
                      child: Text("￥" + price.toString(), textScaleFactor: 1.5, style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),  
      ),
    );
  };

  return SafeArea(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                iosNavBar(ctx),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: aTitle('购物券'),
                ),
                coupons("五一购物券", 99, "2019-11-1", "满 500 可用"),
                coupons("圣诞礼券", 109, "2019-11-1", "无限制"),
              ],
            ),
          ),
        ],
      ),
    ),
  );
});