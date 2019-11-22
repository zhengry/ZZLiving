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
            : Stack(
              children: <Widget>[
                CartListView(cartList: provide.shoppingCarts),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                )
              ],
            ) 
      );
    });
    // return Scaffold(
    //   appBar: AppBar(title: Text('购物车')),
    //   body: FutureBuilder(
    //     future: _getCartInfo(context),
    //     builder: (context,snapshot){
    //       if (snapshot.hasData) {
    //         List cartList = Provide.value<CartProvide>(context).shoppingCarts;
    //         return Stack(
    //           children: <Widget>[
    //             CartListView(cartList: cartList),
    //             Positioned(
    //               bottom: 0,
    //               left: 0,
    //               child: CartBottom(),
    //             )
    //           ],
    //         );
    //       }else {
    //         return Container(
    //           alignment: Alignment.center,
    //           child: Text('加载中...'),
    //         );
    //       }
    //     },
    //   ),
    // );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'success';
  }
}