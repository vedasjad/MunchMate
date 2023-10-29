import 'package:firebase_database/firebase_database.dart';

import '../../../models/order.dart';

class HomeServices {
  Future<void> placeOrder(String localUserID, Order order) async {
    DatabaseReference usersDatabaseReference =
        FirebaseDatabase.instance.ref("users/$localUserID/${order.id}");
    DatabaseReference ordersDatabaseReference =
        FirebaseDatabase.instance.ref("orders/${order.id}");
    usersDatabaseReference.set(order.toMap());
    ordersDatabaseReference.set(order.toMap());
  }
}
