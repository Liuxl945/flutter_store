import 'package:flutter/material.dart';
import 'package:flutter_store/base.dart';
// import 'package:flutter_store/widgets/card.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController ctl;
  String searchKey = '';

  List<String> data = [
    "AABB",
    "aABB",
    "aBaBBB"
    "Baaa",
    "BBaaa",
    "AAACCC"
  ];

  List<String> get filtedData{
    return data.where((v) => v.toLowerCase().startsWith(searchKey.toLowerCase())).toList();
  }


  @override
  void initState() { 
    super.initState();
    ctl = TextEditingController();
  }

  Widget searchBar(){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.deepOrange,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/svg/search.svg",
            height: 18,
            color: Colors.black87,
          ),
          Expanded(
            child: TextField(
              maxLines: 1,
              autofocus: true,
              controller: ctl,
              style: TextStyle(fontSize: 18),
              cursorColor: Colors.deepOrange,
              decoration: InputDecoration(
                hintText: '请输入搜索内容',
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(width: 0,style: BorderStyle.none),
                )
              ),
              onChanged: (value){
                setState(() {
                  searchKey = value;
                });
              },
            ),
          ),
          Offstage(
            offstage: searchKey.length == 0,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  searchKey = '';
                  if(ctl != null) ctl.clear();
                });
              },
              child: Icon(Icons.close,size: 18),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget listResult = ListView.builder(
      itemCount: filtedData.length,
      itemBuilder: (ctx,i){
        final String data = filtedData[i];
        return Container(
          padding: EdgeInsets.all(10),
          child: Text(data),
        );
      },
    );

    if(filtedData.length == 0) listResult = Center(child: Text("no data"));

    return SafeArea(
      child: Column(
        children: <Widget>[
          searchBar(),
          Expanded(
            child: listResult,
          ),
        ],
      ),
    );
  }
}

var searchPage = () => BodyPage.formBuild((ctx, params, router){
  return SearchPage();
},noAnimate: false);