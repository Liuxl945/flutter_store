import 'package:flutter/material.dart';
import 'package:flutter_store/widgets/counter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GoodsCategory {
  String imgUrl;
  String label;
  GoodsCategory(this.imgUrl, this.label);
}

class GoodsCategoryGroup {
  String label;
  List<GoodsCategory> list;
}

class OverLayer extends StatefulWidget {
  final List<GoodsCategoryGroup> categoryList = List.generate(2,(_){
    var group = GoodsCategoryGroup();
    group.label = '种类';
    group.list = List.generate(10, (_) => GoodsCategory('https://img02.hua.com/tuijian/xianshi_2_190303.png', '红色'));
    return group;
  });
  _OverLayerState createState() => _OverLayerState();
}

class _OverLayerState extends State<OverLayer> {
  List<int> selectedIndexs;
  int count = 0;
  @override
  void initState() {
    super.initState();
    selectedIndexs = List.generate(widget.categoryList.length, (_) => 0);
  }

  void close() {
    Navigator.of(context).pop();
  }

  Widget categorySelectBox(bool selected, String url, String text, VoidCallback onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width/4-10,
        height: 40,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          border: selected ? Border.all(color: Colors.deepOrange,width: 2): Border.all(color: Colors.black12,width: 2),
        ),
        child: Row(
          children: <Widget>[
            Image.network(url,width:30),
            SizedBox(width: 5),
            Text(text,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }


  Widget list(){
    List <Widget> categorysList = [];
    int groupIndex = 0;
    for (var item in widget.categoryList) {
      int categoryIndex = 0;
      categorysList.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(item.label),
        )
      );

      categorysList.add(
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 6,
          alignment: WrapAlignment.start,
          children: item.list.map((cate){

            int key = groupIndex;
            int value = categoryIndex;

            var category = categorySelectBox(selectedIndexs[groupIndex] == categoryIndex, cate.imgUrl, cate.label, (){
              setState(() {
                selectedIndexs[key] = value;
              });
            });
            categoryIndex += 1 ;
            return category;
          }).toList(),
        )
      );
      groupIndex += 1;
    }

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text('选择您想要的类型:', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ]..addAll(categorysList),
        ),
      ),
    );
  }

  Widget counter(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('购买数量', style: TextStyle(fontSize: 14)),
          Counter(
            up:(){
              setState(() {
                count +=1;
              });
            },
            down:(){
              if(count == 0) return;
              setState(() {
                count -=1;
              });
            },
            count:count,
          ),
        ],
      ),
    );
  }

  Widget navButton(){
    return GestureDetector(
      onTap: (){
        Fluttertoast.showToast(
          msg: '选中的索引为' + selectedIndexs.toString() + '数量为$count',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.deepOrange,
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child: Text('确认',style:TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: close,
            child: ConstrainedBox(constraints: BoxConstraints()),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height / 2 - 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                child: Column(
                  children: <Widget>[
                    list(),
                    counter(),
                    navButton(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
