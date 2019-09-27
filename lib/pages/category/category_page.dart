import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/pages/category/left_category.dart';
import 'package:zz_living/provides/category_provide.dart';
import 'package:zz_living/pages/category/sub_category.dart';
import 'package:zz_living/provides/category_goods_provide.dart';
import 'goods_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provide.value<CategoryProvide>(context).loadCategoryList();

    return Provide<CategoryProvide>(builder: (context, child, provide) {
      var categoryId = provide.currentMallCategoryId;
      var subCategoryId = provide.currentSubCategoryId;
      Provide.value<CategoryGoodsProvide>(context).changeCategoryId(categoryId);
      Provide.value<CategoryGoodsProvide>(context)
          .changeSubCategoryId(subCategoryId);
      return Scaffold(
        appBar: AppBar(title: Text('分类')),
        body: provide.categoryList == null
            ? Center(child: CupertinoActivityIndicator(radius: 20))
            : Row(
                children: <Widget>[
                  LeftCategory(
                      categoryList: provide.categoryList,
                      selectId: provide.currentMallCategoryId),
                  Expanded(
                    child: Column(
                    children: <Widget>[
                      SubCategoryWidget(
                          subCategoryList: provide
                              .categoryList[provide.selectedIndex].bxMallSubDto,
                          selectedId: provide.currentSubCategoryId),
      
                      Provide<CategoryGoodsProvide>(builder: (context,child,goodsProvide){
                        if (goodsProvide.goodsList.length > 0) {
                          return GoodsListView(goodsList: Provide.value<CategoryGoodsProvide>(context).goodsList);
                        }else {
                          return Center(
                            child: Text('暂无数据'),
                          );
                        }
                      }),
                    ],
                  ),
                  )
                ],
              ),
      );
    });
  }
}
