import 'package:flutter/material.dart';

class GoodsDescriptionWidget extends StatelessWidget {
  const GoodsDescriptionWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
          width: 10,
          color: Colors.black12
        ))
      ),
      child: Text('商品说明：正品保证 > 急速送达',
        style: TextStyle(
          fontSize: 16,
          color: Colors.redAccent
        ),),
    );
  }
}