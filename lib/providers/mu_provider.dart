import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String local = "ar";

  changeLanguage(String local) {
    this.local = local;
    notifyListeners();
  }
}
