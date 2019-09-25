import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/pages/category/left_category.dart';
import 'package:zz_living/provides/category_provide.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provide.value<CategoryProvide>(context).loadCategoryList();

    return Provide<CategoryProvide>(builder: (context, child, provide) {
      return Scaffold(
        appBar: AppBar(title: Text('分类')),
        body: provide.categoryList == null 
            ? Center(child: CupertinoActivityIndicator(radius: 20))
            : Row(
                children: <Widget>[
                  LeftCategory(categoryList: provide.categoryList,selectId: provide.currentMallCategoryId),
                ],
              ),
      );
    });
  }
}
