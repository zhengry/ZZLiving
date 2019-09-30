import 'package:flutter/widgets.dart';
import 'package:zz_living/models/category_goods_model.dart';
import 'package:zz_living/network/network.dart';
import 'dart:convert';

class CategoryGoodsProvide with ChangeNotifier {
  List<CategoryGoodsDetail> _goodsList = [];

  String _categoryId;
  String _subCategoryId;
  int _page = 1;

  String get categoryId => _categoryId;
  String get subCategoryId => _subCategoryId;
  int get page => _page;
  List<CategoryGoodsDetail> get goodsList => _goodsList;
  
  void changeCategoryId(String id) {
    if (_categoryId == id && _goodsList.isNotEmpty) {
      return;
    }
    _categoryId = id;
    if (_categoryId != null && _subCategoryId != null) {
      _page = 1;
      _goodsList.clear();
      loadGoodsList();
      notifyListeners();
    }
    
  }

  void changeSubCategoryId(String id) {
    if (_subCategoryId == id && _goodsList.isNotEmpty) {
      return;
    }
    _subCategoryId = id;
    if (_categoryId != null && _subCategoryId != null) {
      _page = 1;
      _goodsList.clear();
      loadGoodsList();
      notifyListeners();
    }
    
  }

  void loadGoodsList() async {
    var model = await _requestCategoryGoods(categoryId, subCategoryId, page);
    if (model == null) {
      return null;
    }
    if (model.data != null && model.data.isNotEmpty) {
      _goodsList.addAll(model.data);
      
      notifyListeners();
    }
    
    
  }

  Future<CategoryGoodsModel> _requestCategoryGoods(
    String category, String subCategory, int page) async {
    var paras = {
      'categoryId': category,
      'categorySubId': subCategory,
      'page': page
    };
    var response = await requestFor(MallGoodsURL, paras: paras);
    if (response == null) {
      return null;
    }
    var model = CategoryGoodsModel.fromJson(json.decode(response.data));
    return model;
  }
}
