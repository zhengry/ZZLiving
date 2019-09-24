import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/tab_index_provide.dart';
import 'package:zz_living/router/index_tab.dart';

void main() {
  final providers = Providers()
    ..provide(Provider.function((_)=>TabIndexProvide()));


  runApp(ProviderNode(child: ZZLiving(),providers: providers));
} 

class ZZLiving extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: IndexTab(),
    );
  }
}

