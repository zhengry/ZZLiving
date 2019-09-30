

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/goods_detail_provide.dart';

class GoodsDetailPage extends StatelessWidget {
  final arguments;

  const GoodsDetailPage({Key key,this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String id = arguments['id'];
    Provide.value<GoodsDetailProvide>(context).loadGoodsInfo(id);
    return Provide<GoodsDetailProvide>(builder: (context, child, provide){
      return Scaffold(
        appBar: AppBar(title: Text('商品详情')),
        body: provide.goodsDetail == null
            ? Center(child: Text('加载中'))
            : ListView(
              children: <Widget>[
                _goodsImage(provide.goodsDetail.goodInfo.image1, provide.goodsDetail.goodInfo.goodsName, provide.goodsDetail.goodInfo.presentPrice)
              ],
            ),
      );
    });

  }

  Widget _goodsImage(String imageUrl,String name,double price){
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Column(
        children: <Widget>[
          Image.network(imageUrl,height: 300,),
          Text(name,style:TextStyle(
            fontSize:16,
          )),
          Text('￥$price'),
        ],
      ),
    );
  }
}