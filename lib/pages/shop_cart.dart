import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';


var shopCartPage = () => BodyPage.formBuild((ctx, params, router){
  return SafeArea(
    child: Text('ShopCart'),
  );
});