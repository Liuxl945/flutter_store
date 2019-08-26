import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_store/path.dart' as Path;
import 'package:flutter_store/widgets/goods_list.dart';
import 'package:flutter_store/widgets/home_banners.dart';
import 'package:flutter_store/widgets/title.dart';

var categoryPage = () => BodyPage.formBuild((ctx, params, router){
  VoidCallback toShopCart = () => router.to(ctx, Path.ShopCart, {});
  VoidCallback toSearch = () => router.to(ctx, Path.Search, {});
  VoidCallback toUser = () => router.to(ctx, Path.User, {});
  return SafeArea(
    child: Column(
      children: <Widget>[
        Banners(toShopCart, toSearch, toUser),
        Expanded(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: aTitle('爱情鲜花'),
              ),
              GoodList(),
            ],
          ),
        ),
      ],
    ),
  );
},
noAnimate: false);