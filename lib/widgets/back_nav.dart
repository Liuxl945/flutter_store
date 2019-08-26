

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

var iosNavBar = (context) => Offstage(
  offstage:!Platform.isIOS,
  child:GestureDetector(
    child: Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 20,
      color: Color.fromRGBO(244, 244, 244, 1),
      child: Row(
        children: <Widget>[
          SvgPicture.asset("assets/svg/left.svg", width: 20),
        ],
      ),
    ),
  ),
);