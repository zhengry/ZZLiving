import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/provides/category_provide.dart';
import 'package:zz_living/models/category_model.dart';
import 'package:zz_living/provides/category_goods_provide.dart';

// class SubCategoryTab extends StatefulWidget {
  
//   List<BxMallSubDto> subCategories = [];
//   int selectedIndex;

//   SubCategoryTab({Key key,this.subCategories,this.selectedIndex}) : super(key: key);

//   _SubCategoryTabState createState() => _SubCategoryTabState();
// }

// class _SubCategoryTabState extends State<SubCategoryTab> {
//   @override
//   void initState() { 
//     super.initState();
//     print('初始化-----${widget.selectedIndex}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 4,right: 4),
//       alignment: Alignment.center,
//       height: 40,
//       width: MediaQuery.of(context).size.width - 80,
//       child: DefaultTabController(
//          length: widget.subCategories.length,
//          initialIndex: widget.selectedIndex,
//          child: TabBar(
//            indicatorColor: Colors.red,
//            indicatorSize: TabBarIndicatorSize.label,
//            labelColor: Colors.red,
//            unselectedLabelColor: Colors.black45,
//            isScrollable: true,
//            onTap: selectSubIndex,
//            tabs: tabsFromSubCategory(),
//          ),
//        ),
//     );
//   }

//   void selectSubIndex(int index){
//     Provide.value<CategoryProvide>(context).selectSubCategoryIndex(index);
//     var id = Provide.value<CategoryProvide>(context).selectedSubCategoryId;
//     Provide.value<CategoryGoodsProvide>(context).changeSubCategoryId(id);
           
//   }

//   List<Widget> tabsFromSubCategory(){
//     List<Widget> tabs = [];
//     widget.subCategories.forEach((subCategory){
//       var tab = Tab(text: subCategory.mallSubName);
//       tabs.add(tab);
//     });
//     return tabs;
//   }

  
// }

class SubCategoryTab2 extends StatelessWidget {
  final List<BxMallSubDto> subCategories;
  final int selectedIndex;
  const SubCategoryTab2({Key key,this.subCategories,this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4,right: 4),
      alignment: Alignment.center,
      height: 40,
      width: MediaQuery.of(context).size.width - 80,
      child: DefaultTabController(
         length: subCategories.length,
         initialIndex: selectedIndex,
         child: TabBar(
           indicatorColor: Colors.red,
           indicatorSize: TabBarIndicatorSize.label,
           labelColor: Colors.red,
           unselectedLabelColor: Colors.black45,
           isScrollable: true,
           onTap: (index){
             selectSubIndex(context, index);
           },
           tabs: tabsFromSubCategory(),
         ),
       ),
    );
  }
    void selectSubIndex(BuildContext context,int index){
    Provide.value<CategoryProvide>(context).selectSubCategoryIndex(index);
    var id = Provide.value<CategoryProvide>(context).selectedSubCategoryId;
    Provide.value<CategoryGoodsProvide>(context).changeSubCategoryId(id);
           
  }

  List<Widget> tabsFromSubCategory(){
    List<Widget> tabs = [];
    subCategories.forEach((subCategory){
      var tab = Tab(text: subCategory.mallSubName);
      tabs.add(tab);
    });
    return tabs;
  }
}