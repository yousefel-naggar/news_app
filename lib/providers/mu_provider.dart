import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";

  changeLanguage(String local) {
    this.local = local;
    notifyListeners();
  }
}
