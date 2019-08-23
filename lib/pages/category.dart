
import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';

var categoryPage = () => BodyPage.formBuild((ctx, param, router){
 
  return SafeArea(
    child: Text('category${param['id']}'),
  );
},
noAnimate: false);