import 'package:flutter/material.dart';
import 'package:zz_living/pages/cart/cart_page.dart';
import 'package:zz_living/pages/category/category_page.dart';
import 'package:zz_living/pages/home/home_page.dart';
import 'package:zz_living/pages/member/mine_page.dart';
import 'package:zz_living/provides/tab_index_provide.dart';
import 'package:provide/provide.dart';

class IndexTab extends StatelessWidget {
  IndexTab({Key key}) : super(key: key);

  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('会员中心'))
  ];

  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Provide<TabIndexProvide>(
      builder: (context, child, provide) => Scaffold(
        body: pages[provide.currentPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black26,
          selectedItemColor: Colors.red,
          items: _bottomTabs,
          currentIndex: provide.currentPage,
          onTap: (index) {
            provide.changePage(index);
          },
        ),
      ),
    );
  }
}
