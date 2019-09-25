
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:zz_living/models/category_model.dart';
import 'package:zz_living/network/network.dart';
import 'dart:convert';

class CategoryProvide with ChangeNotifier {
  
  List<CategoryData> _categoryList;//分类列表
  String _currentMallCategoryId;//大类分类id
  String _currentSubCategoryId;//子类分类id

  List<CategoryData> get categoryList => _categoryList;
  String get currentMallCategoryId => _currentMallCategoryId;
  String get currentSubCategoryId => _currentSubCategoryId;

  //获取分类列表
  void loadCategoryList() async {
    var model = await _loadCategories();
    _categoryList = model.data;
    CategoryData mallCategory = _categoryList.first;
    _currentMallCategoryId = mallCategory.mallCategoryId;
    
    List<BxMallSubDto> subCategoryList = mallCategory.bxMallSubDto;
    _currentSubCategoryId = subCategoryList.first.mallCategoryId;
  }

  // 修改大类分类
  void changeMallCategory(String categoryId){
    _currentMallCategoryId = categoryId;
  }

  //修改子类分类
  void changeSubCategory(String subCategoryId){
    _currentSubCategoryId = subCategoryId;
  }


  Future<CategoryModel> _loadCategories() async {
    Response response = await requestFor(CategoryURL);
    CategoryModel model = CategoryModel.fromJson(json.decode(response.data));
    return model;
  }
}