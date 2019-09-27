

import 'package:flutter/material.dart';
import 'package:zz_living/models/category_goods.dart';

class GoodsListView extends StatelessWidget {
  final List<CategoryGoodsDetail> goodsList;
  const GoodsListView({Key key, this.goodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 90,
      height: MediaQuery.of(context).size.height - (88 + 100 + 40),
      child: _goodsItems(),
    );
    // return _goodsItems();
  }

  Widget _goodsItems() {
    // return SliverGrid(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       mainAxisSpacing: 0,
    //       childAspectRatio: 1.0,
    //     ),
    //     delegate: SliverChildBuilderDelegate(
    //       (context,index){
    //         return Container(
    //           padding: EdgeInsets.all(4),
    //           child: Column(
    //             children: <Widget>[
    //               Image.network(goodsList[index].image,fit: BoxFit.fill),
    //               SizedBox(height: 4,),
    //               Text('￥${goodsList[index].presentPrice}'),
    //             ],
    //           ),
    //         );
    //       },
    //       childCount: goodsList.length,
    //     ),
    //   );
    return ListView.builder(
      itemCount: goodsList.length,
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Image.network(goodsList[index].image,
                fit: BoxFit.fill, width: 120, height: 120),
            Expanded(  
              child: Column(
              children: <Widget>[
                Text(goodsList[index].goodsName,maxLines: 3,),
                Text('￥${goodsList[index].presentPrice}'),
              ],
            ),
            ),
          ],
        );
      },
    );
  }
}
