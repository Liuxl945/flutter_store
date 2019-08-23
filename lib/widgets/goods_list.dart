import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_store/path.dart' as Path;
import 'package:flutter_store/router.dart';


final goods = [
  {'name': "爱情鲜花", 'imgUrl':"https://img01.hua.com/uploadpic/newpic/9012038.jpg_220x240.jpg"},
  {'name': "长辈鲜花", 'imgUrl':"https://img01.hua.com/uploadpic/newpic/9012092.jpg_220x240.jpg"},
  {'name': "永生花", 'imgUrl':"https://img01.hua.com/uploadpic/newpic/1073211.jpg_220x240.jpg"},
  {'name': "蛋糕", 'imgUrl':"https://img01.hua.com/uploadpic/newpic/1207010.jpg_220x240.jpg"},
  {'name': "礼品", 'imgUrl':"https://img01.hua.com/uploadpic/newpic/1060030.jpg_220x240.jpg"},
];


class GoodBox extends StatelessWidget{
  String name;
  String imgUrl;
  VoidCallback routerCallback;
  GoodBox(this.name, this.imgUrl, {this.routerCallback});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: routerCallback,
      child: Container(
        width: screenWidth / 2 - 20,
        child: Column(
          children: <Widget>[
            FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: this.imgUrl, height: 150,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(this.name),
            )
          ],
        ),
      ),
    );
  }
}


class GoodList extends StatelessWidget {
  List<Widget> list(BuildContext ctx){
    return List.generate(goods.length, (i){
      var item = goods[i];
      return GoodBox(item['name'], item['imgUrl'], routerCallback: (){
        route.to(ctx, Path.User, {"name": item['name']});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: list(context),
          ),
        ),
      ),
    );
  }
}
