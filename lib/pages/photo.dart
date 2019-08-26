import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:photo_view/photo_view.dart';

var phonePage = () => BodyPage.formBuild((ctx, params, router){
  return Container(
    child: PhotoView(
      heroTag:params['url'],
      imageProvider: NetworkImage(params['url']),
      minScale:PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.contained * 1.8,
    ),
  );
},noAnimate: false);