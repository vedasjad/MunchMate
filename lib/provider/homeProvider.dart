import 'package:flutter/material.dart';
import 'package:munchmate/common/constants.dart';

class HomeProvider extends ChangeNotifier {
  String _selectedItemType = itemTypes[0];

  void updateSelectedItemType(String item) {
    _selectedItemType = item;
    notifyListeners();
  }

  get selectedItemType => _selectedItemType;
}
