import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/cart_provide.dart';
import 'cart_list.dart';
import 'cart_bottom.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provide.value<CartProvide>(context).getCartInfo();
    return Provide<CartProvide>(builder: (context, child, provide) {
      // List cartList = Provide.value<CartProvide>(context).shoppingCarts;
      return Scaffold(
        appBar: AppBar(title: Text('购物车')),
        body: provide.shoppingCarts.isEmpty
            ? Center(child: Text('加载中'))
            // 使用Stack 列表部分和底部合计部分会有重叠
            // : Stack(
            //   children: <Widget>[
            //     CartListView(cartList: provide.shoppingCarts),
            //     Positioned(
            //       bottom: 0,
            //       left: 0,
            //       child: CartBottom(),
            //     )
            //   ],
            // ) 
            : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: CartListView(cartList: provide.shoppingCarts,),
                  ),
                  CartBottom()
                ],
              ),
            )
      );
    });
  }
}