import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_store/widgets/tab.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_store/path.dart' as Path;
import 'package:webview_flutter/webview_flutter.dart';


class AppPaginationBuilder extends SwiperPlugin {
  Widget build(BuildContext context,SwiperPluginConfig config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = themeData.primaryColor;
    Color color = themeData.scaffoldBackgroundColor;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, .2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                decoration: BoxDecoration(
                  color:Color.fromRGBO(0, 0, 0, 0.2),
                  borderRadius:BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "${config.activeIndex + 1}",
                      style:TextStyle(color: activeColor, fontSize: 20),
                    ),
                    Text(
                      "/",
                      style: TextStyle(color: color, fontSize: 16),
                    ),
                    Text(
                      "${config.itemCount}",
                      style: TextStyle(color: color, fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


var detailPage = () => BodyPage.formBuild((ctx, param, router){
  final List photo = [
    "https://img01.hua.com/uploadpic/newpic/9010011.jpg_220x240.jpg",
    "https://img01.hua.com/uploadpic/newpic/9012345.jpg_220x240.jpg",
    "https://img01.hua.com/uploadpic/newpic/9012413.jpg_220x240.jpg"
  ];



  var swiper = Container(
    height: 320,
    child: Theme(
      data: Theme.of(ctx).copyWith(primaryColor: Colors.deepOrange),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Hero(
            tag: photo[index],
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: photo[index],
              fit: BoxFit.cover,
            ),
          );
        },
        onTap: (i){
          router.to(ctx, Path.Photo, {'url':photo[i]});
        },
        loop: true,
        itemCount: photo.length,
        control: SwiperControl(iconNext: null,iconPrevious: null),
        pagination: AppPaginationBuilder(),
      ),
    ),
  );

  Widget divider = Container(height: 10, color: Color.fromRGBO(244, 244, 244, 1));

  Widget price = Container(
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Text(
                '￥177.91',
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
              Text(
                "￥299.80",
                style: TextStyle(color: Colors.grey, fontSize: 16,decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
        divider,
      ],
    ),
  );

  Widget title = Container(
    padding: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.redAccent,
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          margin: EdgeInsets.only(right: 10),
          child: Text(
            '爆款',
            style:TextStyle(color: Colors.white,fontSize: 16),
          ),
        ),
        Expanded(
          child: Text(
            '温柔如你--戴安娜粉玫瑰12枝，石竹戴安娜粉玫瑰12枝，石竹梅7枝梅7枝',
            textScaleFactor:1.2,
            maxLines:2,
            overflow:TextOverflow.ellipsis,
          ),
        )
      ],
    ),
  );

  var infoItem = (String title, String text){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          Container(
            child: Text(
              title,
              style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  };

  Widget infomation = Column(
    children: <Widget>[
      price,
      SizedBox(height: 10),
      title,
      SizedBox(height: 5),
      infoItem('类别','鲜花-鲜花'),
      infoItem('材料','戴安娜粉玫瑰12枝戴安娜粉玫瑰12枝戴安娜粉玫瑰12枝，石竹梅7枝，叶上花10枝'),
      infoItem('包装','蓝色方形花桶'),
      SizedBox(height: 10),
    ],
  );

  var bottomButton = (String text, Color color,VoidCallback onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        color: color,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  };

  Widget bottomNav = Positioned(
    bottom: MediaQuery.of(ctx).padding.bottom,
    left: 0,
    right: 0,
    child: Container(
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10,right: 3),
                  child: SvgPicture.asset('assets/svg/gouwuche.svg',width:20),
                ),
                StatefulBuilder(
                  builder: (BuildContext ctx, _updater) {
                    return Text('11111');
                  },
                ),
              ],
            ),
          ),
          bottomButton("加入购物车", Colors.deepOrange,(){
            Fluttertoast.showToast(
              msg: "加入购物车成功",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }),
          bottomButton("购买", Colors.red,(){
            
          }),
        ],
      ),
    ),
  );

  Widget imageInfo = ATab(
    tabs: ['图文介绍','评价'],
    childrens: <Widget>[
      Container(
        height: 1000,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child:InAppWebView(
                  initialUrl: "https://yingliyingli.com/",
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        child: FutureBuilder(
          future: Future.value('''<h1>hello world!!</h1>\n<p> i am p tag </p><img src='https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png'/>'''),
          builder:(BuildContext context, snapshot){
            return Html(data: snapshot.data);
          },
        ),
      ),
    ],
  );

  return Stack(
    children: <Widget>[
      SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.only(bottom: 70),
          children: <Widget>[
            swiper,
            infomation,
            divider,
            imageInfo,
          ],
        ),
      ),
      bottomNav
    ],
  );
},noAnimate: false);