import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String shopCartIcon = 'assets/svg/gouwuche.svg';
final String userIcon = 'assets/svg/wode.svg';
final String searchIcon = 'assets/svg/search.svg';


class Banners extends StatelessWidget {
  final VoidCallback toShopCart;
  final VoidCallback toSearch;
  final VoidCallback toUser;

  Banners(this.toShopCart, this.toSearch, this.toUser);

  Widget searchBar() {
    return Expanded(
      child: GestureDetector(
        onTap: toSearch,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(searchIcon, width: 24),
                Text(" 搜 索")
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: toShopCart,
            child: SvgPicture.asset(shopCartIcon, width: 24),
          ),
          searchBar(),
          GestureDetector(
            onTap: toUser,
            child: SvgPicture.asset(userIcon, width: 24),
          ),
        ],
      ),
    );
  }
}
