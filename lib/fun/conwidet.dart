import 'package:flutter/material.dart';
import 'package:my_health/message/IFpage.dart';
import 'package:my_health/message/messagepage.dart';
import 'package:my_health/page/IFconpage.dart';
import 'package:my_health/page/bmipage.dart';
import 'package:my_health/page/homepage.dart';
import 'package:my_health/page/runpage.dart';
import 'package:my_health/page/setting.dart';
import 'package:my_health/page/userpage.dart';

class Conwidet with ChangeNotifier {
  final List<Widget> _pagewidet = [
    Homepage(key: ValueKey(0)),
    Runpage(key: ValueKey(1)),
    Userpage(key: ValueKey(2)),
    Bmipage(key: ValueKey(3)),
    messageone(key: ValueKey(3)),
    Ifpage(key: ValueKey(4)),
    IFconpage(key: ValueKey(5)),
    Setting(key: ValueKey(6))
  ];

  int _currentwidet = 0;

  Widget get currentwidet => _pagewidet[_currentwidet];
  int get current => _currentwidet;

  void goToWidet (int index){
    _currentwidet = index;
    notifyListeners();
  }
}