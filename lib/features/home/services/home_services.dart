import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:munchmate/models/local_user.dart';

import '../../../models/item.dart';
import '../../../models/order.dart' as order_model;

class HomeServices {
  Future<void> placeOrder(
      String localUserID, order_model.Order order, List<Item> items) async {
    DatabaseReference usersDatabaseReference =
        FirebaseDatabase.instance.ref("users/$localUserID/orders/${order.id}");
    DatabaseReference ordersDatabaseReference =
        FirebaseDatabase.instance.ref("orders/${order.id}");
    await usersDatabaseReference.set(order.toMap());
    await ordersDatabaseReference.set(order.toMap());
    for (int i = 0; i < order.items.length; i++) {
      DatabaseReference itemDatabaseReference =
          FirebaseDatabase.instance.ref("items/${order.items[i].id}");
      await itemDatabaseReference.update({
        "totalQuantity": items
                .firstWhere((element) => element.id == order.items[i].id)
                .totalQuantity -
            order.itemCounts[i],
      }).onError((error, stackTrace) => debugPrint(error.toString()));
    }
  }

  void updateUserData(LocalUser localUser) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    Map<String, dynamic> updatedUser = {
      "id": localUser.id,
      "name": localUser.name,
      "email": localUser.email,
      "photoURL": localUser.photoURL,
    };
    db.collection("users").doc(localUser.id).set(updatedUser);
  }
}
