import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../models/order.dart';
import 'localUserProvider.dart';

class OrderProvider extends ChangeNotifier {
  final Order _order = Order(
    id: "",
    items: [],
    itemCounts: [],
    totalPrice: 0,
    dateTime: DateTime(2023),
  );

  void addItemToOrder(Item item) {
    if (!_order.items.contains(item)) {
      _order.items.add(item);
      _order.itemCounts.add(0);
    }
    int itemIndex = _order.items.indexOf(item);
    _order.itemCounts[itemIndex]++;
    _order.totalPrice += item.price;
    notifyListeners();
  }

  void removeItemFromOrder(Item item) {
    int itemIndex = _order.items.indexOf(item);
    _order.itemCounts[itemIndex]--;
    if (_order.itemCounts[itemIndex] == 0) {
      _order.items.remove(item);
      _order.itemCounts.removeAt(itemIndex);
    }
    _order.totalPrice -= item.price;
    notifyListeners();
  }

  void clearOrder() {
    _order.itemCounts.clear();
    _order.items.clear();
    _order.id = "";
    _order.dateTime = DateTime(2023);
    _order.totalPrice = 0;
    notifyListeners();
  }

  void updateOrderID(BuildContext context) {
    _order.dateTime = DateTime.now();
    _order.id = (Provider.of<LocalUserProvider>(context, listen: false)
                .localUser
                .lastOrders
                .length +
            1)
        .toString();
    notifyListeners();
  }

  get order => _order;
}
