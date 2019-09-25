import 'package:flutter/material.dart';
import 'package:zz_living/models/category_model.dart';

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
          return _categoryItem(context, category.mallCategoryName,
              category.mallCategoryId == selectId);
        },
      ),
    );
  }

  Widget _categoryItem(BuildContext context, String name, bool isSelected) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: Text(name,
          style: TextStyle(
              color: isSelected ? Colors.red : Colors.black45, fontSize: 16)),
    );
  }
}
