
import 'dart:async';
import 'package:dio/dio.dart';

const BaseURL = 'http://v.jspang.com:8088/baixing';
const HomeURL = BaseURL + '/wxmini/homePageContent';//首页
const HomeHotURL = BaseURL + '/wxmini/homePageBelowConten';//首页火爆专区
const CategoryURL = BaseURL + '/wxmini/getCategory';//分类列表
const MallGoodsURL = BaseURL + '/wxmini/getMallGoods';//分类列表商品
const GoodsDetailURL = BaseURL + '/wxmini/getGoodDetailById';//商品详情

Future<Response> requestFor(String url,{Map paras}) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    if (paras == null) {
      response = await dio.post(url);
    } else {
      response = await dio.post(url, data: paras);
    }
    if (response.statusCode == 200) {
      // print(response.data);
      return response;
    } else {
      print('network error');
      return null;
    }
  } catch (e) {
    print('ERROR: $e');
    return null;
  }
}