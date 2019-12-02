import 'package:flutter/material.dart';
import 'index_tab.dart';
import 'package:zz_living/pages/detail/goods_detail_page.dart';

final routes = {
  '/': (context) => IndexTab(),
  '/detail': (context, {arguments}) => GoodsDetailPage(arguments: arguments),
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  } else {
    return null;
  }
}
