import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:munchmate/models/item.dart';

class Order {
  late String id;
  final List<Item> items;
  final List<int> itemCounts;
  late int totalPrice;
  late DateTime dateTime;
  Order({
    required this.id,
    required this.items,
    required this.itemCounts,
    required this.totalPrice,
    required this.dateTime,
  });

  Order copyWith({
    String? id,
    List<Item>? items,
    List<int>? itemCounts,
    int? totalPrice,
    DateTime? dateTime,
  }) {
    return Order(
      id: id ?? this.id,
      items: items ?? this.items,
      itemCounts: itemCounts ?? this.itemCounts,
      totalPrice: totalPrice ?? this.totalPrice,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});
    result.addAll({'itemCounts': itemCounts});
    result.addAll({'totalPrice': totalPrice});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});

    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      items: List<Item>.from(map['items']?.map((x) => Item.fromMap(x))),
      itemCounts: List<int>.from(map['itemCounts']),
      totalPrice: map['totalPrice']?.toInt() ?? 0,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, items: $items, itemCounts: $itemCounts, totalPrice: $totalPrice, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Order &&
        other.id == id &&
        listEquals(other.items, items) &&
        listEquals(other.itemCounts, itemCounts) &&
        other.totalPrice == totalPrice &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        items.hashCode ^
        itemCounts.hashCode ^
        totalPrice.hashCode ^
        dateTime.hashCode;
  }
}
