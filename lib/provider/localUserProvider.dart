import 'package:flutter/material.dart';

import '../models/order.dart';
import '../models/user.dart';

class LocalUserProvider extends ChangeNotifier {
  late LocalUser _localUser;
  void addLocalUser(LocalUser localUser) {
    _localUser = localUser;
  }

  void addOrder(Order order) {
    _localUser.lastOrders.add(order);
    notifyListeners();
  }

  get localUser => _localUser;
}
