import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_store/widgets/home_banners.dart';
import 'package:flutter_store/path.dart' as Path;

final homePage = () => BodyPage.formBuild((ctx, params, router) {
      VoidCallback toShopCart = () => router.to(ctx, Path.ShopCart, {});
      VoidCallback toSearch = () => router.to(ctx, Path.Search, {});
      VoidCallback toUser = () => router.to(ctx, Path.User, {});

      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Banners(toShopCart, toSearch, toUser),
            Expanded(
              child: ListView(
                children: <Widget>[],
              ),
            )
          ],
        ),
      );
    });
