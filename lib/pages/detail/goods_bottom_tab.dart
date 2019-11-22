import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/goods_detail_provide.dart';
import 'package:zz_living/provides/cart_provide.dart';

/* 详情页底部加入购物车部分 */

class GoodsBottomTab extends StatelessWidget {
  const GoodsBottomTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var goodsInfo = Provide.value<GoodsDetailProvide>(context).goodsDetail.goodInfo;

    final double _cartWidth = 80;
    final double _btnWidth =
        (MediaQuery.of(context).size.width - _cartWidth) * 0.5;
    return Container(
      color: Colors.white,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          _shoppingCart(_cartWidth, () {
            // 跳转到购物车
            
          }),
          _bottomBtn(_btnWidth, '加入购物车', Colors.green, () {
            Provide.value<CartProvide>(context).addToCart(goodsInfo, 1);
          }),
          _bottomBtn(_btnWidth, '立即购买', Colors.redAccent, () {
            Provide.value<CartProvide>(context).clearCart();
          })
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
