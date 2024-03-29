import 'package:flutter/material.dart';
import 'package:flutter_store/router.dart';
import 'package:flutter_store/path.dart' as Path;


typedef Widget BuildFn(BuildContext ctx, Map params, NoRoute router);

class BodyPage extends Page {
  BuildFn _build;
  bool noAnimate = true;
  String title;
  // DateTime _lastPressedAt;

  static final routerPage = [
    Path.Home,
    Path.Subject,
    Path.User,
  ];

  bottomNavigationBar(ctx, path, NoRoute router){
    var _selectedIndex = -1;

    if(path == routerPage[0]){
      _selectedIndex = 0;
    }else if(path == routerPage[1]){
      _selectedIndex = 1;
    }else if(path == routerPage[2]){
      _selectedIndex = 2;
    }

    if(_selectedIndex == -1) return null;
    const IconData home = IconData(0xe60d, fontFamily: 'Nav');
    const IconData gift = IconData(0xe616, fontFamily: 'Nav');
    const IconData contact = IconData(0xe64a, fontFamily: 'Nav');

    return BottomNavigationBar(
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(home), title: Text('首页')),
        BottomNavigationBarItem(icon: Icon(gift), title: Text('专题')),
        BottomNavigationBarItem(icon: Icon(contact), title: Text('用户')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.deepOrange,
      onTap: (index){
        if(_selectedIndex == index)  return;

        router.to(ctx, routerPage[index], {});
      }
    );
  }

  build(Map params, router) {
    if(noAnimate)
    {
      return PageRouteBuilder(
        pageBuilder: (ctx, _, __){
          return Scaffold(
              body: _build(ctx, params, router),
              bottomNavigationBar: bottomNavigationBar(ctx, params["path"] ?? Path.InitialRoute, router),
//              drawer: layout.drawer(ctx)
          );
        }
      );
   }
   return MaterialPageRoute(builder: (ctx){
     var appBar = this.title != null ?
        AppBar(title: Text(this.title), backgroundColor: Colors.deepOrange, centerTitle: false, elevation: 0,)
         : null;
      return Scaffold(
        appBar: appBar,
        body: _build(ctx, params, router),
        bottomNavigationBar: bottomNavigationBar(ctx, params["path"] ?? Path.InitialRoute, router),
//        drawer: layout.drawer(ctx)
      );
    },
    );
  }
  
  BodyPage.formBuild(BuildFn build, {this.noAnimate = true, this.title}) {
    _build = build;
  }
}