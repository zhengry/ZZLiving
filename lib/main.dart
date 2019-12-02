import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/tab_index_provide.dart';
import 'package:zz_living/provides/home_provide.dart';
import 'package:zz_living/provides/category_provide.dart';
import 'package:zz_living/provides/category_goods_provide.dart';
import 'package:zz_living/provides/goods_detail_provide.dart';
import 'provides/cart_provide.dart';
import 'router/routes.dart';

void main() {
  final providers = Providers()
    ..provide(Provider.function((_)=>TabIndexProvide()))
    ..provide(Provider.function((_)=>HomeProvide()))
    ..provide(Provider.function((_)=>CategoryProvide()))
    ..provide(Provider.function((_)=>CategoryGoodsProvide()))
    ..provide(Provider.function((_)=>GoodsDetailProvide()))
    ..provide(Provider.function((_)=>CartProvide()));


  runApp(ProviderNode(child: ZZLiving(),providers: providers));
} 

class ZZLiving extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute:"/",
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }  
}

