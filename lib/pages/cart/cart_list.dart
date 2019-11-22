import 'package:flutter/material.dart';
import 'package:zz_living/models/shopping_cart_model.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {

  final List<ShoppingCartModel> cartList;

  const CartListView({Key key,this.cartList}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartList.length,
      itemBuilder: (context,index){
        return CartItem(model: cartList[index]);
      });
  }
}