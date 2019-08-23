import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_store/widgets/card.dart';
import 'package:flutter_store/widgets/title.dart';
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

  var UserAvatar = CardBox(
    height: 120,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 10),
        ClipOval(
          child: Container(
            child: Image.network('https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1',fit:BoxFit.cover),
            width: 80,
            height: 80,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('花钱买罪',textScaleFactor:1.4),
                Text('独家视频丨习近平到空军某基地视察：确保一旦有事能上得去、打得赢',textScaleFactor:1.2,overflow: TextOverflow.ellipsis,maxLines: 2),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ATitle("个人中心"),
          UserAvatar,
          SizedBox(height: 10),
          SelectItem("购物车", "/shop_cart"),
          SelectItem("优惠券", "/coupon"),
          SelectItem("修改密码", "/change_pass"),
          SelectItem("退出", "/exit"),
        ],
      ),
    ),
  );
});
