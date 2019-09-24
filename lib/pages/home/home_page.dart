import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zz_living/pages/home/floor_content.dart';
import 'package:zz_living/pages/home/home_recommend.dart';
import 'package:zz_living/pages/home/leader_phone.dart';
import 'home_banner.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/home_provide.dart';
import 'home_category.dart';

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
                    HomeCategoryView(categories: homeProvide.homeModel.data.category),
                    AdBanner(bannerImage: homeProvide.homeModel.data.advertesPicture.pICTUREADDRESS),
                    LeaderPhone(image: homeProvide.homeModel.data.shopInfo.leaderImage,mobile: homeProvide.homeModel.data.shopInfo.leaderPhone),
                    HomeRecommend(recommendList: homeProvide.homeModel.data.recommend,),
                    
                    FloorTitle(floorPic: homeProvide.homeModel.data.floor1Pic.pICTUREADDRESS),FloorContent(floorContent: homeProvide.homeModel.data.floor1),
                    
                    FloorTitle(floorPic: homeProvide.homeModel.data.floor2Pic.pICTUREADDRESS),FloorContent(floorContent: homeProvide.homeModel.data.floor2),
                    
                    FloorTitle(floorPic: homeProvide.homeModel.data.floor3Pic.pICTUREADDRESS),FloorContent(floorContent: homeProvide.homeModel.data.floor3),
                    
                  ],
                ));
    });
  }
}
