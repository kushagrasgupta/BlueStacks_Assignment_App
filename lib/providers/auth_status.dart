import 'package:flutter/material.dart';

class AuthStatus with ChangeNotifier {
  int _flag = 0; //0->logout, 1->login
  int get flag => _flag;
  void login() {
    _flag++;
    notifyListeners();
  }

  void logOut() {
    _flag--;
    notifyListeners();
  }
}
