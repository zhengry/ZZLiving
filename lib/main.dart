import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/tab_index_provide.dart';
import 'package:zz_living/provides/home_provide.dart';
import 'package:zz_living/provides/category_provide.dart';
import 'package:zz_living/router/index_tab.dart';
import 'package:zz_living/provides/category_goods_provide.dart';

void main() {
  final providers = Providers()
    ..provide(Provider.function((_)=>TabIndexProvide()))
    ..provide(Provider.function((_)=>HomeProvide()))
    ..provide(Provider.function((_)=>CategoryProvide()))
    ..provide(Provider.function((_)=>CategoryGoodsProvide()));


  runApp(ProviderNode(child: ZZLiving(),providers: providers));
} 

class ZZLiving extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        primarySwatch: Colors.red,
      ),
      home: IndexTab(),
    );
  }
}

