import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/cart_provide.dart';


class CartBottom extends StatelessWidget {
  const CartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provide = Provide.value<CartProvide>(context);
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          _allCheckedBtn(context,provide.allChecked),
          _allPriceArea(provide.checkPrice),
          _settleBtn(provide.checkedCount)
        ],
      ),
    );
  }

  Widget _allCheckedBtn(BuildContext context,bool isChecked){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isChecked,
            activeColor: Colors.redAccent,
            onChanged: (bool checked){
              Provide.value<CartProvide>(context).changeAllCheckedStatus(checked);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  Widget _allPriceArea(double price){
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('合计：',style: TextStyle(color: Colors.black87,fontSize: 14)),
              Text('￥$price',style: TextStyle(color: Colors.redAccent,fontSize: 14))
            ],
          ),
          Text('满10元免配送费，预购免配送费',
          style: TextStyle(color: Colors.black87,fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _settleBtn(int count){
    return Expanded(
      child: Container(
        // width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(3))
        ),
        child: Text('结算($count)',style: TextStyle(color: Colors.white,fontSize: 16)),
        
      ),
    );


  }
  
}