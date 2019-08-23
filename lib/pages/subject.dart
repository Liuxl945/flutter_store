import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
import 'package:flutter_store/widgets/card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transparent_image/transparent_image.dart';


class _Subject extends StatefulWidget {
  _Subject({Key key}) : super(key: key);

  __SubjectState createState() => __SubjectState();
}

class __SubjectState extends State<_Subject> {
  RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  static List subjects = [
    {'id': 1,'name': '劳动节','imgUrl': 'https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1'},
    {'id': 2,'name': '旅行','imgUrl': 'https://st-gdx.dancf.com/templets/80488/shots/20190219-150002-8-219.png?x-oss-process=image/resize,w_760/interlace,1'},
    {'id': 3,'name': '永生花','imgUrl': 'https://st-gdx.dancf.com/templets/89047/shots/20190422-110740-e5FFE.png?x-oss-process=image/resize,w_760/interlace,1'},
    {'id': 4,'name': '蛋糕','imgUrl': 'https://st-gdx.dancf.com/templets/87804/shots/20190409-102741-8o_8l.png?x-oss-process=image/resize,w_760/interlace,1'},
    {'id': 5,'name': '礼品','imgUrl': 'https://st-gdx.dancf.com/gaodingx/39/design/20190410-183237-9781.png?x-oss-process=image/resize,w_760/interlace,1'}
  ];

  Widget list(){
    return ListView.builder(
      itemCount: subjects.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        Map subject = subjects[index];

        return GestureDetector(
          child: Container(
            margin: EdgeInsets.fromLTRB(10,10,10,0),
            padding: EdgeInsets.all(10),
            decoration: boxDecoration,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: subject['imgUrl'], fit: BoxFit.cover,height: 135,width:double.infinity),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    subject['name'],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  onRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    subjects.removeRange(5,subjects.length);
    setState((){
      
    });
    refreshController.refreshCompleted();
  }

  onLoading() async{
    await Future.delayed(Duration(seconds: 2));
    subjects.add({'id': 1,'name': 'test','imgUrl': 'https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1'});
    setState(() {
      
    });
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        controller:refreshController,
        enablePullUp: true,
        header: ClassicHeader(
          idleIcon: Container(),
          releaseText: '释放后刷新',
          refreshingText: '刷新中...',
          completeText: '刷新完成',
          failedText: '刷新失败',
          idleText: '继续下拉进行刷新',
        ),
        footer: ClassicFooter(
          loadingText: '加载中...',
          idleText: "载入更多"
        ),
        child: list(),
        onRefresh: onRefresh,
        onLoading: onLoading,
      ),
    );
  }
}

final subjectPage = () => BodyPage.formBuild((ctx, params, router) {
  return _Subject();
});