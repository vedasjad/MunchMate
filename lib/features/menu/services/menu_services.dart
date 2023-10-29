import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../../../models/item.dart';

class MenuServices {
  Future<List<Item>> getItems() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref("items");
    final List<Item> items = [];
    databaseReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      final res = jsonDecode(jsonEncode(data));
      int i = 1;
      items.clear();
      while (true && data != null) {
        if (res["ITEM$i"] == null) {
          break;
        }
        items.add(Item.fromMap(res["ITEM$i"]));
        i++;
      }
    });
    return items;
  }
}
