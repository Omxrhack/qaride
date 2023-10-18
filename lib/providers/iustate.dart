import 'package:flutter/material.dart';

class UIServices extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  int _SelectedIndex = 1;

  // ignore: non_constant_identifier_names
  int get SelectedIndex => _SelectedIndex;

  // ignore: non_constant_identifier_names
  set SelectedIndex(int index) {
    _SelectedIndex = index;
    notifyListeners();
  }
}
