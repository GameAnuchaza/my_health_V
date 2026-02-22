import 'package:flutter/material.dart';

class Statelogin with ChangeNotifier {
  bool _islogin = false;

  bool get islogin => _islogin;

  void login(){
    _islogin = true;
    notifyListeners();
  }

  void logout() {
    _islogin = false;
    notifyListeners();
  }
}