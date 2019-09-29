import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/category_provide.dart';
import 'package:zz_living/models/category_model.dart';
import 'package:zz_living/provides/category_goods_provide.dart';

class SubCategoryTab extends StatefulWidget {
  
  List<BxMallSubDto> subCategories = [];
  int selectedIndex;

  SubCategoryTab({Key key,this.subCategories,this.selectedIndex}) : super(key: key);

  _SubCategoryTabState createState() => _SubCategoryTabState();
}

class _SubCategoryTabState extends State<SubCategoryTab> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4,right: 4),
      alignment: Alignment.center,
      height: 40,
      width: MediaQuery.of(context).size.width - 80,
      child: DefaultTabController(
         length: widget.subCategories.length,
         initialIndex: widget.selectedIndex,
         child: TabBar(
           indicatorColor: Colors.red,
           indicatorSize: TabBarIndicatorSize.label,
           labelColor: Colors.red,
           unselectedLabelColor: Colors.black45,
           isScrollable: true,
           onTap: (index){
            Provide.value<CategoryProvide>(context).selectSubCategoryIndex(index);
            var id = Provide.value<CategoryProvide>(context).selectedSubCategoryId;
            Provide.value<CategoryGoodsProvide>(context).changeSubCategoryId(id);
           },
           tabs: tabsFromSubCategory(),
         ),
       ),
    );
  }

  List<Widget> tabsFromSubCategory(){
    List<Widget> tabs = [];
    widget.subCategories.forEach((subCategory){
      var tab = Tab(text: subCategory.mallSubName);
      tabs.add(tab);
    });
    return tabs;
  }

  
}