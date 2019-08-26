
import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_store/widgets/back_nav.dart';

final changePassPage = () => BodyPage.formBuild((ctx, params, router) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map valueMap = {
    "old_pass": "",
    "pass": "",
    "comfirm_pass": ""
  };

  String validator(String val) {
    return val.length < 6 ? "密码长度错误" : null;
  }

  String validatorComfirm(val){
    return valueMap["pass"] == val ? null : "确认密码不一致";
  }

  var _ctl = TextEditingController();
  _ctl.addListener((){
    valueMap["pass"] = _ctl.value.text;
  });

  var field = (String label, FormFieldValidator<String> validator, String fieldName, [TextEditingController ctl]){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.deepOrange,
        controller: ctl != null ? ctl : null,
        scrollPadding:EdgeInsets.fromLTRB(0,0,0,0),
        decoration: InputDecoration(
            hasFloatingPlaceholder: false,
            labelText: label, border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange))
        ),
        obscureText: true,
        validator: validator,
        onSaved: (val) {
          valueMap[fieldName] = val;
        },
      ),
    );
  };

  void forSubmitted(){
    var form = formKey.currentState;

    if(form.validate()){
      form.save();
      print(valueMap);
    }
  }

  return SafeArea(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            iosNavBar(ctx),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text("修改密码", textScaleFactor: 1.4),
            ),
            field("旧密码", validator, "old_pass"),
            // field("新密码", validator, "pass", _ctl),
            // field("确认密码", validatorComfirm, "comfirm_pass"),
            FlatButton(
              color: Colors.deepOrange,
              child: Text("提交", style: TextStyle(color: Colors.white)),
              onPressed: () => forSubmitted(),
            )
          ],
        ),
      ),
    ),
  );
});