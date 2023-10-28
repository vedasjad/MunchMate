import 'package:flutter/material.dart';
import 'package:munchmate/common/constants.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import 'localUserProvider.dart';

class MenuProvider extends ChangeNotifier {
  String _selectedItemType = itemTypes[0];
  List<Item> _selectedItemTypeList = [];

  void updateSelectedItemType(String itemType, BuildContext context) {
    _selectedItemType = itemType;
    _selectedItemTypeList = [];
    for (int index = 0; index < items.length; index++) {
      if (items[index].type == _selectedItemType ||
          _selectedItemType == itemTypes[0]) {
        _selectedItemTypeList.add(items[index]);
      } else if (_selectedItemType == itemTypes[4]) {
        if (Provider.of<LocalUserProvider>(context, listen: false)
            .localUser
            .favourites
            .contains(items[index])) {
          _selectedItemTypeList.add(items[index]);
        }
      }
    }
    notifyListeners();
  }

  void getAllItems() {
    _selectedItemTypeList.addAll(items);
  }

  get selectedItemType => _selectedItemType;
  get selectedItemTypeList => _selectedItemTypeList;
}
