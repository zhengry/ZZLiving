import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/pages/category/left_category.dart';
import 'package:zz_living/provides/category_provide.dart';
import 'package:zz_living/provides/category_goods_provide.dart';
import 'goods_list.dart';
import 'sub_category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 加判断，防止页面进入详情页后返回时页面重新加载
    if (Provide.value<CategoryProvide>(context).categoryList == null) {
      Provide.value<CategoryProvide>(context).loadCategoryList();
    } 

    return Provide<CategoryProvide>(builder: (context, child, provide) {
      var categoryId = provide.selectedCategoryId;
      var subCategoryId = provide.selectedSubCategoryId;
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
                      selectId: provide.selectedCategoryId),
                  
                  Expanded(
                    child: Column(
                    children: <Widget>[
                      SubCategoryWidget(subCategoryList: provide.subCategoryList,selectedId: provide.selectedSubCategoryId,),
                      
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
