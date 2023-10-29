import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../../../models/order.dart';

class LastOrderServices {
  Future<List<Order>> getLastOrders(String localUserID) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref("users/$localUserID/orders");
    final List<Order> lastOrders = [];
    databaseReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      final res = jsonDecode(jsonEncode(data));
      int i = 1;
      lastOrders.clear();
      while (true && data != null) {
        if (res["$localUserID$i"] == null) {
          break;
        }
        lastOrders.add(Order.fromMap(res["$localUserID$i"]));
        i++;
      }
    });
    return lastOrders;
  }
}
