import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './home_banner.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/home_provide.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provide.value<HomeProvide>(context).loadHomeData();

    return Provide<HomeProvide>(builder: (context, child, homeProvide) {
      return Scaffold(
          appBar: AppBar(title: Text('百姓生活+')),
          body: homeProvide.homeModel == null
              ? CupertinoActivityIndicator(radius: 20)
              : ListView(
                  children: <Widget>[
                    HomeBanner(bannerImages: homeProvide.homeModel.data.slides),
                  ],
                ));
    });
  }
}
