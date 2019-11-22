import 'package:flutter/material.dart';
import 'package:zz_living/models/shopping_cart_model.dart';
import 'package:zz_living/models/goods_detail_model.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvide with ChangeNotifier {
  List<ShoppingCartModel> _cartList = []; // 购物车商品列表
  String _cartListString = '[]'; // 购物车商品（持久化）
  bool _isAllChecked = false;
  int _allCartCount = 0; //购物车所有商品数量
  int _allCheckedCount = 0; //购物车选中商品数量
  double _allCheckedPrice = 0.0; //所有选中商品价格




  // 添加商品到购物车
  void addToCart(GoodInfoBean model, int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _cartListString = prefs.getString('cartInfo');
    List<dynamic> carts = _cartListString == null ? '[]' : json.decode(_cartListString);

    bool isInclude = false;
    int index = 0;
    // carts.forEach((item){
    //   if (item['goodsId'] == model.goodsId) {
    //     print('添加了同一个商品');
    //     item['count'] += count;
    //     isInclude = true;
    //   }
    //   index++;
    // });
    while (isInclude == false && index < carts.length) {
      var item = carts[index];
      if (item['goodsId'] == model.goodsId) {
        print('添加了同一个商品');
        item['count'] += count;
        isInclude = true;
      }
      index++;
    }
    if (!isInclude) {
      carts.add({
        'goodsName':model.goodsName,
        'goodsId':model.goodsId,
        'goodsImg':model.image1,
        'oriPrice':model.oriPrice,
        'price':model.presentPrice,
        'count':count,
        'isChecked':true,
      });
    }
    _notifyChange(carts);
  }

  void _notifyChange(List carts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cartInfo', json.encode(carts));
    _cartListString = json.encode(carts);
    print(_cartListString);
    _cartList.clear();
    _cartList.addAll(carts.isEmpty ? [] : ShoppingCartModel.fromJsonList(carts));
    _changeCartStatus();
    notifyListeners();
  }
// 修改数量和选中状态
  void _changeCartStatus(){
    _allCartCount = 0;
    _allCheckedCount = 0;
    _allCheckedPrice = 0;
    _isAllChecked = true;

    _cartList.forEach((item){
      _allCartCount += item.count;
      if (!item.isChecked) {
        _isAllChecked = false;
      }else {
        _allCheckedCount += item.count;
        _allCheckedPrice += (item.count * item.price);
      }
    });
  }

  //   清空购物车
  clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    _notifyChange([]);
  }

// 清除某一个商品
  clearGoods(String goodsId){

  }





}