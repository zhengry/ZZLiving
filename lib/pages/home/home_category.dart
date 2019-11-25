import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/models/home_page_model.dart';
import 'package:zz_living/provides/tab_index_provide.dart';

class HomeCategoryView extends StatelessWidget {
  final List<Category> categories;

  HomeCategoryView({Key key, @required this.categories}) : super(key: key);

  Widget _categoryItem(BuildContext context,String imgUrl,String name) {
    return Container(
              child: InkWell(
                onTap: (){
                  Provide.value<TabIndexProvide>(context).changePage(1);
                },
                child: Column(
                  children: <Widget>[
                    Image.network(imgUrl,fit: BoxFit.fitWidth,),
                    Text(name),
                  ],
                ),
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    if (categories.length > 10) categories.removeRange(10, categories.length);
    return Container(
      height: MediaQuery.of(context).size.width * 0.5,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),//不可滑动
        padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 0,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            Category item = categories[index];
            return _categoryItem(context,item.image, item.mallCategoryName);
          },
        ),
    );
  }

   
}