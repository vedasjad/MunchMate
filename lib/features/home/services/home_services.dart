import 'package:firebase_database/firebase_database.dart';

import '../../../models/order.dart';

class HomeServices {
  Future<void> placeOrder(String localUserID, Order order) async {
    DatabaseReference usersDatabaseReference =
        FirebaseDatabase.instance.ref("users/$localUserID/orders/${order.id}");
    DatabaseReference ordersDatabaseReference =
        FirebaseDatabase.instance.ref("orders/${order.id}");
    await usersDatabaseReference.set(order.toMap());
    await ordersDatabaseReference.set(order.toMap());
  }
}
