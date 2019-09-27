import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/models/category_model.dart';
import 'package:zz_living/provides/category_provide.dart';
import 'package:zz_living/provides/category_goods_provide.dart';

class LeftCategory extends StatelessWidget {
  final List<CategoryData> categoryList;
  final String selectId;
  const LeftCategory({Key key, this.categoryList, this.selectId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.black12))),
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          CategoryData category = categoryList[index];
          return _categoryItem(context,category, index);
        },
      ),
    );
  }

  Widget _categoryItem(BuildContext context,CategoryData data,int index) {

    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: data.mallCategoryId == selectId ? Colors.black12 : Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: InkWell(
        onTap: (){
          Provide.value<CategoryProvide>(context).selectMallIndex(index);
          var categoryId = Provide.value<CategoryProvide>(context).currentMallCategoryId;
          Provide.value<CategoryGoodsProvide>(context).changeCategoryId(categoryId);
        },
        child: Text(data.mallCategoryName,
          style: TextStyle(
              color: data.mallCategoryId == selectId ? Colors.red : Colors.black45, fontSize: 16),
      )),
    );
  }
}
