

import 'package:flutter/material.dart';
import 'package:zz_living/models/category_goods_model.dart';
import 'category_goods_item.dart';

class GoodsListView extends StatelessWidget {
  final List<CategoryGoodsDetail> goodsList;
  const GoodsListView({Key key, this.goodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      height: MediaQuery.of(context).size.height - (88 + 100 + 40),
      child: _goodsItems(),
    );
    // return _goodsItems();
  }

  Widget _goodsItems() {
  
    // return ListView.builder(
    //   itemCount: goodsList.length,
    //   itemBuilder: (context, index) {
    //     return InkWell(
    //       onTap: (){
    //         Navigator.pushNamed(context,'/detail',arguments: {'id':goodsList[index].goodsId});
    //       },
    //       child: Row(
    //       children: <Widget>[
    //         Image.network(goodsList[index].image,
    //             fit: BoxFit.fill, width: 120, height: 120),
    //         Expanded(  
    //           child: Column(
    //           children: <Widget>[
    //             Text(goodsList[index].goodsName,maxLines: 3,),
    //             Text('￥${goodsList[index].presentPrice}'),
    //           ],
    //         ),
    //         ),
    //       ],
    //     ),
    //     );
    //   },
    // );
    return GridView.builder(
      itemCount: goodsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        childAspectRatio: 5/7
        
      ),
      itemBuilder: (context,index){
        var item = goodsList[index];
        return CategoryGoodsItem(item: item,);
      },
    );
  }


  
}
