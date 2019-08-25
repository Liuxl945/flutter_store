import 'package:flutter/material.dart';

class ATab extends StatefulWidget {
  num initSelectIndex=0;
  void Function(num i) onTabSelected;
  List<Widget> childrens;
  List<String> tabs;

  ATab({
    this.initSelectIndex = 0,
    this.onTabSelected,
    this.childrens,
    this.tabs,
  });

  @override
  _ATabState createState() => _ATabState();
}

class _ATabState extends State<ATab> {
  num _index;
  double opacity = 1;
  var duration = Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();
    _index = widget.initSelectIndex;
    print(widget.childrens[_index]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 50,
          width: double.infinity,
          child: Flex(
            direction: Axis.horizontal,
            children: List.generate(
              widget.tabs.length,
              (i){
                return Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() async{
                        opacity = 0;
                        await Future.delayed(duration);

                        setState(() {
                          _index = i;
                          opacity = 1;
                        });
                      });

                      if(widget.onTabSelected != null){
                        widget.onTabSelected(i);
                      }
                    },
                    child: Container(
                      height: 50,
                      color: i == _index ? Colors.deepOrange : Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        widget.tabs[i],
                        style: TextStyle(
                          color: i == _index ? Colors.white : Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: opacity,
          duration: duration,
          child: widget.childrens[_index],
        ),
      ],
    );
  }
}