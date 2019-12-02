import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/models/shopping_cart_model.dart';
import 'package:zz_living/provides/cart_provide.dart';

class CartItem extends StatelessWidget {
  final ShoppingCartModel model;
  const CartItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail',
              arguments: {'id': model.goodsId});
        },
        child: Row(
          children: <Widget>[
            _checkBox(context, model.goodsId, model.isChecked),
            _goodsImage(model.goodsImg),
            _goodsName(context, model.goodsId, model.goodsName, model.count),
            _goodsPrice(context, model.goodsId, model.oriPrice, model.price,
                model.count)
          ],
        ),
      ),
    );
  }

  Widget _checkBox(BuildContext context, String goodsId, bool isChecked) {
    return Container(
      child: Checkbox(
        value: isChecked,
        activeColor: Colors.redAccent,
        onChanged: (bool value) {
          Provide.value<CartProvide>(context)
              .changeGoodsChecked(goodsId, value);
        },
      ),
    );
  }

  Widget _goodsImage(url) {
    return Container(
      width: 100,
      height: 100,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Image.network(url),
    );
  }

  Widget _goodsName(
      BuildContext context, String goodsId, String title, int count) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.black87, fontSize: 15)),
            // 增加数量
            _goodsCountWidget(context, goodsId, count)
          ],
        ),
      ),
    );
  }

  Widget _goodsCountWidget(BuildContext context, String goodsId, int count) {
    return Container(
      width: 80,
      height: 30,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 30,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: InkWell(
                child: Text('-',
                    style: TextStyle(fontSize: 18, color: Colors.black87)),
                onTap: () {
                  Provide.value<CartProvide>(context)
                      .changeGoodsCount(goodsId, false);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('$count'),
            ),
          ),
          Expanded(
            child: Container(
              width: 30,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: InkWell(
                child: Text('+',
                    style: TextStyle(fontSize: 18, color: Colors.black87)),
                onTap: () {
                  Provide.value<CartProvide>(context)
                      .changeGoodsCount(goodsId, true);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _goodsPrice(BuildContext context, String goodsId, double oriPrice,
      double price, int count) {
    return Container(
      width: 100,
      // color: Colors.orange,
      alignment: Alignment.topRight,
      child: Column(
        children: <Widget>[
          Text(
            '￥${price * count}',
            style: TextStyle(color: Colors.black87, fontSize: 15),
          ),
          Text('￥${oriPrice * count}',
              style: TextStyle(color: Colors.black38, fontSize: 13)),
          Container(
            child: InkWell(
              child: Icon(Icons.delete_forever),
              onTap: () {
                Provide.value<CartProvide>(context).clearGoods(goodsId);
              },
            ),
          )
        ],
      ),
    );
  }
}
