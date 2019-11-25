import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/models/category_model.dart';
import 'package:zz_living/provides/category_goods_provide.dart';
import 'package:zz_living/provides/category_provide.dart';

class SubCategoryWidget extends StatelessWidget {

  final List<BxMallSubDto> subCategoryList;
  final String selectedId;
  ScrollController _scrollController = ScrollController();
  SubCategoryWidget({Key key,this.subCategoryList,this.selectedId}) : super(key: key);

  Widget _itemForSubCategory(BuildContext context, BxMallSubDto category,int index){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 10),
      child: InkWell(
        child: Text(
          category.mallSubName,
          style: TextStyle(
            color: category.mallSubId == selectedId ? Colors.red : Colors.black45,
            fontSize: 14,
          ),
        ),
        onTap: (){
          Provide.value<CategoryProvide>(context).selectSubCategoryIndex(index);
          var subCategoryId = Provide.value<CategoryProvide>(context).selectedSubCategoryId;
          Provide.value<CategoryGoodsProvide>(context)
            .changeSubCategoryId(subCategoryId);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 5),
      height: 40,
      width: MediaQuery.of(context).size.width - 80,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0,color: Colors.black12))
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subCategoryList.length,
        itemBuilder: (context,index){
          var category = subCategoryList[index];
          return _itemForSubCategory(context, category,index);
        },
      )
    );
  }
}