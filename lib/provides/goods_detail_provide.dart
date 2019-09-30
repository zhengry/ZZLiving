
import 'package:flutter/cupertino.dart';
import 'package:zz_living/models/goods_detail_model.dart';
import 'package:zz_living/network/network.dart';
import 'dart:convert';




class GoodsDetailProvide with ChangeNotifier {
  GoodsDetailInfo _goodsDetail;


  GoodsDetailInfo get goodsDetail => _goodsDetail;


  void loadGoodsInfo(String id) async {
    _goodsDetail = await _loadGoods(id);
    notifyListeners();
  }


  Future<GoodsDetailInfo> _loadGoods(String id) async{
    var response = await requestFor(GoodsDetailURL,paras:{'goodId':id});
    GoodsDetailModel model = GoodsDetailModel.fromMap(json.decode(response.data));
    return model.data;
  }
  
}