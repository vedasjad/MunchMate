import 'package:flutter/material.dart';
import 'package:munchmate/common/constants.dart';

import '../models/item.dart';
import '../models/order.dart';

class HomeProvider extends ChangeNotifier {
  late Order _order;
  String _selectedItemType = itemTypes[0];

  void selectItemType(Item item) {
    _selectedItemType = item.name;
  }

  get selectedItemType => _selectedItemType;
}
