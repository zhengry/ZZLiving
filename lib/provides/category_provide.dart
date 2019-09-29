
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:zz_living/models/category_model.dart';
import 'package:zz_living/network/network.dart';
import 'dart:convert';
import 'package:zz_living/models/category_goods.dart';

class CategoryProvide with ChangeNotifier {
  
  List<CategoryData> _categoryList;//分类列表
  List<BxMallSubDto> _subCategoryList;//子类列表
  
  int _categoryIndex;
  int _subCategoryIndex;
  String _currentCategoryId;//大类分类id
  String _currentSubCategoryId;//子类分类id


  List<CategoryData> get categoryList => _categoryList;
  List<BxMallSubDto> get subCategoryList => _subCategoryList;
  String get selectedCategoryId => _currentCategoryId;
  String get selectedSubCategoryId => _currentSubCategoryId;
  int get subCategoryIndex => _subCategoryIndex;
  int get categoryIndex => _categoryIndex;

  //获取分类列表
  void loadCategoryList() async {
    var model = await _loadCategories();
    _categoryList = model.data;
    selectCategoryIndex(0);
    notifyListeners();
  }

  void selectCategoryIndex(int index){
    if (index == _categoryIndex) {
      return;
    }
    CategoryData category = _categoryList[index];
    _categoryIndex = index;
    _subCategoryIndex = 0;
    _currentCategoryId = category.mallCategoryId;
    _currentSubCategoryId = category.bxMallSubDto.first.mallSubId;
    _subCategoryList = category.bxMallSubDto;
    
    notifyListeners();
  }

  void selectSubCategoryIndex(int index){
    if (index == _subCategoryIndex) {
      return;
    }
    _subCategoryIndex = index;
    CategoryData category = _categoryList[_categoryIndex];
    _currentSubCategoryId = category.bxMallSubDto[_subCategoryIndex].mallSubId;
    
    notifyListeners();
  }


  Future<CategoryModel> _loadCategories() async {
    Response response = await requestFor(CategoryURL);
    CategoryModel model = CategoryModel.fromJson(json.decode(response.data));
    return model; 
  }

}