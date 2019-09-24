import 'package:flutter/material.dart';

class TabIndexProvide with ChangeNotifier {
  int _page = 0;
  int get currentPage => _page;
  changePage(int page){
    _page = page;
    notifyListeners();
  }
}