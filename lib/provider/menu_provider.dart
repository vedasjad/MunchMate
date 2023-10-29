import 'package:flutter/material.dart';
import 'package:munchmate/common/constants.dart';
import 'package:munchmate/features/menu/services/menu_services.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import 'localUserProvider.dart';

class MenuProvider extends ChangeNotifier {
  String _selectedItemType = itemTypes[0];
  List<Item> _selectedItemTypeList = [];
  List<Item> _items = [];
  MenuServices menuServices = MenuServices();

  void updateSelectedItemType(String itemType, BuildContext context) {
    _selectedItemType = itemType;
    _selectedItemTypeList = [];
    for (int index = 0; index < _items.length; index++) {
      if (_items[index].category == _selectedItemType ||
          _selectedItemType == itemTypes[0]) {
        _selectedItemTypeList.add(_items[index]);
      } else if (_selectedItemType == itemTypes[4]) {
        if (Provider.of<LocalUserProvider>(context, listen: false)
            .localUser
            .favourites
            .contains(_items[index])) {
          _selectedItemTypeList.add(_items[index]);
        }
      }
    }
    notifyListeners();
  }

  getAllItems() async {
    final List<Item> realTimeItems = await menuServices.getItems();
    if (_items.isEmpty) {
      _items = realTimeItems;
      notifyListeners();
    }
  }

  get selectedItemType => _selectedItemType;
  get selectedItemTypeList => _selectedItemTypeList;
}
