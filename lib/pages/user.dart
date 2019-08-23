import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_svg/flutter_svg.dart';



final userPage = () => BodyPage.formBuild((ctx, params, router) {

  var SelectItem = (String text, String path){
    return GestureDetector(
      onTap: () => router.to(ctx, path, params),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(text,textScaleFactor:1.1),
            ),
            SvgPicture.asset("assets/svg/right.svg", height: 16)
          ],
        ),
      ),
    );
  };

  
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          SelectItem("购物车", "/shop_cart"),
          SelectItem("优惠券", "/coupon"),
          SelectItem("修改密码", "/change_pass"),
        ],
      ),
    ),
  );
});
