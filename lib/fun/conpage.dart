import 'package:flutter/material.dart';
import 'package:my_health/home.dart';
import 'package:my_health/loading.dart';

class ConPage extends ChangeNotifier {
  final List<Widget> _pages = [
    Loading(),
    Home(),     // 0

  ];

  int _currentIndex = 0;

  Widget get currentPage => _pages[_currentIndex];

  void goToPage(int index) {
    if (index < 0 || index >= _pages.length) return;

    _currentIndex = index;
    notifyListeners();
  }
}
