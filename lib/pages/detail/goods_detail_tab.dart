
import 'package:flutter/material.dart';
import 'package:zz_living/provides/goods_detail_provide.dart';
import 'package:provide/provide.dart';

class GoodsDetailTab extends StatelessWidget {
  const GoodsDetailTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvide>(
      builder: (context,child,provider){
        var isLeft = Provide.value<GoodsDetailProvide>(context).isLeft;
        var isRight = Provide.value<GoodsDetailProvide>(context).isRight;
        return Row(
          children: <Widget>[
            _goodsNormalTab(context, '详情', true, isLeft),
            _goodsNormalTab(context, '评价', false, isRight)
          ],
        );
      },
    );
  }


  // title: tab名字，isLeft:是否是左侧tab，isSelected：是否选中
  Widget _goodsNormalTab(BuildContext context, String title, bool isLeft, bool isSelected){
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 3,color: isSelected ? Colors.redAccent : Colors.white10)
          )
        ),
        child: Text(title,style:TextStyle(
          fontSize: 18,
          color:isSelected ? Colors.redAccent : Colors.black87
        )),
      ),
      onTap: (){
        Provide.value<GoodsDetailProvide>(context).changeTab(isLeft);
      },
    );
  }
}