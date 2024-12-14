import 'package:flutter/material.dart';

class BottomVm extends ChangeNotifier {
  int selected = 0;
  void toggle(int index) {
    selected = index;
    notifyListeners();
  }
}
