import 'package:flutter/material.dart';
import 'package:munchmate/common/constants.dart';

import '../models/order.dart';

class HomeProvider extends ChangeNotifier {
  late Order _order;
  String _selectedItemType = itemTypes[0];

  void updateSelectedItemType(String item) {
    _selectedItemType = item;
  }

  get selectedItemType => _selectedItemType;
}
