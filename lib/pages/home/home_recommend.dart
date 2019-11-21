import 'package:flutter/material.dart';
import 'package:zz_living/models/home_page_model.dart';


class HomeRecommend extends StatelessWidget {

  final List<Recommend> recommendList;
  const HomeRecommend({Key key,this.recommendList}) : super(key: key);


  Widget _recommendTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0,color: Colors.black12))),
      child: Text('推荐商品',style:TextStyle(fontSize:16)),
    );
  }

  Widget _recommendItem(BuildContext context,int index){
    final item = recommendList[index];
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/detail',arguments:{'id':item.goodsId});
      },
      child: Container(
        alignment: Alignment.topCenter,
        height: 180.0,
        width: MediaQuery.of(context).size.width / 3.0,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.black12),
            bottom: BorderSide(color: Colors.black12),
          ),
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(recommendList[index].image,height: 120,),
            Text('￥${item.mallPrice}',
                  style: TextStyle(fontSize: 16.0)),
              Text('￥${item.price}',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black45))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          _recommendTitle(),
          Row(
            children: <Widget>[
              _recommendItem(context, 0),
              _recommendItem(context, 1),
              _recommendItem(context, 2),
            ],
          )
        ],
      ),
    );
  }
}