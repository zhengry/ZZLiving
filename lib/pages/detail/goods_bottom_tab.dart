import 'package:flutter/material.dart';

/* 详情页底部加入购物车部分 */

class GoodsBottomTab extends StatelessWidget {
  const GoodsBottomTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _cartWidth = 80;
    final double _btnWidth =
        (MediaQuery.of(context).size.width - _cartWidth) * 0.5;
    return Container(
      color: Colors.white,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          _shoppingCart(_cartWidth, () {}),
          _bottomBtn(_btnWidth, '加入购物车', Colors.green, () {}),
          _bottomBtn(_btnWidth, '立即购买', Colors.redAccent, () {})
        ],
      ),
    );
  }

  // 购物车按钮
  Widget _shoppingCart(double width, void Function() onTap) {
    return InkWell(
      child: Container(
        width: width,
        child: Icon(Icons.add_shopping_cart, color: Colors.redAccent,size: 30,),
      ),
      onTap: onTap,
    );
  }

  // 底部按钮
  Widget _bottomBtn(
      double width, String title, Color bgColor, void Function() onTap) {
    return InkWell(
        child: Container(
          width: width,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
          color: bgColor,
        ),
        onTap: onTap);
  }
}
