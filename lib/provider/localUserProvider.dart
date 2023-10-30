import 'package:flutter/material.dart';
import 'package:munchmate/features/ordersHistory/services/last_orders_services.dart';

import '../models/local_user.dart';
import '../models/order.dart';

class LocalUserProvider extends ChangeNotifier {
  late LocalUser _localUser;
  LastOrderServices lastOrderServices = LastOrderServices();
  void addLocalUser(LocalUser localUser) {
    _localUser = localUser;
  }

  void getLastOrders(BuildContext context) async {
    final List<Order> realTimeOrders =
        await lastOrderServices.getLastOrders(_localUser.id);
    if (_localUser.lastOrders.isEmpty) {
      _localUser.lastOrders = realTimeOrders;
    }
    notifyListeners();
  }

  get localUser => _localUser;
}
