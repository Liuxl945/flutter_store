
import 'package:flutter/material.dart';
import 'package:flutter_store/pages/category.dart';
import 'package:flutter_store/pages/change_pass.dart';
import 'package:flutter_store/pages/coupon.dart';
import 'package:flutter_store/pages/detail.dart';
import 'package:flutter_store/pages/home.dart';
import 'package:flutter_store/pages/photo.dart';
import 'package:flutter_store/pages/search.dart';
import 'package:flutter_store/pages/shop_cart.dart';
import 'package:flutter_store/pages/subject.dart';
import 'package:flutter_store/pages/subject_detail.dart';
import 'package:flutter_store/pages/user.dart';
import 'package:flutter_store/router.dart';
import 'package:flutter_store/path.dart' as Path;

class DemoApp extends StatelessWidget {
  static RouteFactory router = (RouteSettings settings){
    PageRoute widget;
    route.pages.forEach((path, page){
      if(path == settings.name){
        var args = settings.arguments;
        if(args == null){
          args = {
            'name': settings.name,
            'init': settings.isInitialRoute
          };
        }else{
          (args as Map)["path"] = settings.name;
          (args as Map)["init"] = false;
        }
        widget = page.build(args, route);
      }
    });
    return widget;
  };

  DemoApp(){
    route.add(Path.Home, homePage());
    route.add(Path.User, userPage());
    route.add(Path.Subject, subjectPage());
    route.add(Path.Category, categoryPage());
    route.add(Path.ShopCart, shopCartPage());
    route.add(Path.Search, searchPage());
    route.add(Path.Detail, detailPage());
    route.add(Path.Photo, phonePage());
    route.add(Path.Coupon, couponPage());
    route.add(Path.ChangePass, changePassPage());
    route.add(Path.SubjectDetail, SubjectDetailPage());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme:ThemeData(
        primaryColor: Colors.deepOrange,
        dividerColor: Colors.deepOrange,
        // scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Path.InitialRoute,
      onGenerateRoute: router,
    );
  }
}