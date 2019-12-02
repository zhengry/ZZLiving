import 'package:flutter/material.dart';
import 'package:zz_living/models/goods_detail_model.dart';

class GoodsTopWidget extends StatelessWidget {
  final GoodInfoBean goodsInfo;
  const GoodsTopWidget({Key key, this.goodsInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _goodsImage(goodsInfo.image1, goodsInfo.goodsName,
          goodsInfo.presentPrice, goodsInfo.oriPrice),
    );
  }

  Widget _goodsImage(
      String imageUrl, String name, double price, double marketPrice) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 10, color: Colors.black12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(imageUrl),
          SizedBox(height: 10),
          Text(name,
              style: TextStyle(
                fontSize: 16,
              )),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: <Widget>[
                Text('￥$price', style: TextStyle(fontSize: 16)),
                SizedBox(width: 10),
                Text('市场价：￥$marketPrice',
                    style: TextStyle(color: Colors.black45))
              ],
            ),
          )
        ],
      ),
    );
  }
}
