import 'package:flutter/material.dart';
import 'package:zz_living/models/home_page_model.dart';

class FloorTitle extends StatelessWidget {
  final String floorPic;

  FloorTitle({Key key, @required this.floorPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            child: Image.network(floorPic),
            padding: const EdgeInsets.symmetric(vertical: 12.0)));
  }
}

class FloorContent extends StatelessWidget {
  final List<Floor> floorContent;

  FloorContent({Key key, @required this.floorContent}) : super(key: key);

  Widget _goodsImg(Floor floorItem, context) {
    return InkWell(
        child: Image.network(floorItem.image,
            width: MediaQuery.of(context).size.width / 2),
        onTap: () {
          Navigator.pushNamed(context, '/detail',arguments: {'id':floorItem.goodsId});
        });
  }

  Widget _topRow(context) {
    return Row(children: <Widget>[
      _goodsImg(floorContent[0], context),
      Column(children: <Widget>[
        _goodsImg(floorContent[1], context),
        _goodsImg(floorContent[2], context),
      ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
          _topRow(context),
          Row(children: <Widget>[
            _goodsImg(floorContent[3], context),
            _goodsImg(floorContent[4], context),
          ])
        ]
      )
    );
  }
}
