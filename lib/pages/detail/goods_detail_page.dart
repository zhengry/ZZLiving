import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/pages/detail/goods_bottom_tab.dart';
import 'package:zz_living/pages/detail/goods_description.dart';
import 'package:zz_living/provides/goods_detail_provide.dart';
import 'goods_top_widget.dart';
import 'goods_detail_tab.dart';
import 'goods_detail_web.dart';


class GoodsDetailPage extends StatelessWidget {
  final arguments;

  const GoodsDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = arguments['id'];
    Provide.value<GoodsDetailProvide>(context).loadGoodsInfo(id);
    return Provide<GoodsDetailProvide>(builder: (context, child, provide) {
      return Scaffold(
        appBar: AppBar(title: Text('商品详情')),
        body: provide.goodsDetail == null
            ? Center(child: Text('加载中'))
            : Stack(
                children: <Widget>[
                  _goodsContents(provide),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GoodsBottomTab(),
                  )
                ],
              ),
      );
    });
  }

  // 商品详情内容
  Widget _goodsContents(GoodsDetailProvide provide) {
    return ListView(
      children: <Widget>[
        GoodsTopWidget(goodsInfo: provide.goodsDetail.goodInfo),
        GoodsDescriptionWidget(),
        GoodsDetailTab(),
        GoodsDetailWeb(),
      ],
    );
  }
}
