import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';

final userPage = () => BodyPage.formBuild((ctx, params, router) {
  return SafeArea(
    child: Text('User'),
  );
});