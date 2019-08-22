import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  static RouteFactory router = (RouteSettings settings){
    PageRoute widget;
    router
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      initialRoute: '/',
      onGenerateRoute: router,
    )
  }
}