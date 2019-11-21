
import 'package:flutter/cupertino.dart';
import 'package:zz_living/models/goods_detail_model.dart';
import 'package:zz_living/network/network.dart';
import 'dart:convert';




class GoodsDetailProvide with ChangeNotifier {
  GoodsDetailInfo _goodsDetail;

  bool _tabIsLeft = true;
  bool _tabIsRight = false;

  GoodsDetailInfo get goodsDetail => _goodsDetail;
  bool get isLeft => _tabIsLeft;
  bool get isRight => _tabIsRight;

  void changeTab(bool isLeft) {
    _tabIsLeft = isLeft;
    _tabIsRight = !isLeft;
    if (isLeft) {
      
    } else {

    }
    notifyListeners();
  }

  void loadGoodsInfo(String id) async {
    _goodsDetail = await _loadGoods(id);
    notifyListeners();
  }


  Future<GoodsDetailInfo> _loadGoods(String id) async{
    var response = await requestFor(GoodsDetailURL,paras:{'goodId':id});
    if (response == null) {
      print('商品数据为空');
      return null;
    }
    GoodsDetailModel model = GoodsDetailModel.fromMap(json.decode(response.data));
    return model.data;
  }
  
}