import 'package:flutter/foundation.dart';
import 'package:zz_living/models/home_page_model.dart';
import 'package:zz_living/network/network.dart';
import 'dart:convert';

class HomeProvide with ChangeNotifier {
  HomePageModel _homeModel;

  HomePageModel get homeModel => _homeModel;

  void loadHomeData() async {
    _homeModel = await _getHomePageContent();
    notifyListeners();
  }

  // 加载首页数据
  Future<HomePageModel> _getHomePageContent() async {
    Map paras = {'lon': '115.02932', 'lat': '35.76189'};
    var response = await requestFor(HomeURL, paras: paras);
    // if (response.data == null) {
    //   print('加载首页数据为空');
    //   return null;
    // }
    return HomePageModel.fromJson(json.decode(response.data));
  }
}
