import 'package:flutter/material.dart';
import 'package:zz_living/models/shopping_cart_model.dart';

class CartItem extends StatelessWidget {
  final ShoppingCartModel model;
  const CartItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          _checkBox(model.isChecked),
          _goodsImage(model.goodsImg),
          _goodsName(model.goodsName, model.count),
          _goodsPrice(model.oriPrice, model.price)
          // _goodsCountView(model.count)
        ],
      ),
    );
  }

  Widget _checkBox(bool isChecked) {
    return Container(
      child: Checkbox(
        value: true,
        activeColor: Colors.redAccent,
        onChanged: (bool value) {},
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

  Widget _goodsName(String title, int count) {
    return Expanded(
      child: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.black87, fontSize: 15)),
            // 增加数量
            _goodsCountWidget(count)
          ],
        ),
      ),
    );
  }

  Widget _goodsCountWidget(int count) {
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
                onTap: () {},
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
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _goodsPrice(double oriPrice, double price) {
    return Container(
      width: 100,
      // color: Colors.orange,
      alignment: Alignment.topRight,
      child: Column(
        children: <Widget>[
          Text(
            '￥$price',
            style: TextStyle(color: Colors.black87, fontSize: 15),
          ),
          Text('￥$oriPrice',
              style: TextStyle(color: Colors.black38, fontSize: 13)),
          Container(
            child: InkWell(
              child: Icon(Icons.delete_forever),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
