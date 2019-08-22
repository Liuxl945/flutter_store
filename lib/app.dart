import 'package:flutter/material.dart';
import 'package:flutter_store/pages/home.dart';
import 'package:flutter_store/pages/subject.dart';
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
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      initialRoute: '/',
      onGenerateRoute: router,
    );
  }
}