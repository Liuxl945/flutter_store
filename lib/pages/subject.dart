import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';

final subjectPage = () => BodyPage.formBuild((ctx, params, router) {
  return SafeArea(
    child: Text('Subject'),
  );
});