import 'package:flutter/material.dart';
import 'package:zz_living/models/category_goods_model.dart';

class CategoryGoodsItem extends StatelessWidget {
  final CategoryGoodsDetail item;
  const CategoryGoodsItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              right: BorderSide(width: 1, color: Colors.black12),
              bottom: BorderSide(width: 1, color: Colors.black12))),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail',
              arguments: {'id': item.goodsId});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(item.image),
            Container(
              padding: EdgeInsets.only(left: 3, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${item.goodsName}', maxLines: 2),
                  Row(
                    children: <Widget>[
                      Text('￥${item.presentPrice}',
                          style:
                              TextStyle(color: Colors.black87, fontSize: 16)),
                      SizedBox(width: 10),
                      Text(
                        '￥${item.oriPrice}',
                        style: TextStyle(color: Colors.black38, fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
