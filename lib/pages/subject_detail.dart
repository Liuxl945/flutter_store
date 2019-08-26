
import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_store/router.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

final subjectDetailPage = () => BodyPage.formBuild((ctx, params, router) {
  return SafeArea(
    child: Text('subjectDetailPage'),
  );
});

class SubjectDetailPage extends Page {
  Map params;
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  PageRoute build(Map params, NoRoute router){
    return PageRouteBuilder(pageBuilder: (ctx, _, __){
      return SafeArea(
        child: WebviewScaffold(
          url: 'https://yingliyingli.com',
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          // initialChild: Container(
          //   color: Colors.redAccent,
          //   child: const Center(
          //     child: Text('Waiting.....'),
          //   ),
          // ),
        ),
      );
    });
  }
}