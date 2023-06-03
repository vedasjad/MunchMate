import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:munchmate/models/item.dart';

class Order {
  final String id;
  final List<Item> items;
  final List<int> itemCounts;
  Order({
    required this.id,
    required this.items,
    required this.itemCounts,
  });

  Order copyWith({
    String? id,
    List<Item>? items,
    List<int>? itemCounts,
  }) {
    return Order(
      id: id ?? this.id,
      items: items ?? this.items,
      itemCounts: itemCounts ?? this.itemCounts,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});
    result.addAll({'itemCounts': itemCounts});

    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      items: List<Item>.from(map['items']?.map((x) => Item.fromMap(x))),
      itemCounts: List<int>.from(map['itemCounts']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() => 'Order(id: $id, items: $items, itemCounts: $itemCounts)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Order &&
        other.id == id &&
        listEquals(other.items, items) &&
        listEquals(other.itemCounts, itemCounts);
  }

  @override
  int get hashCode => id.hashCode ^ items.hashCode ^ itemCounts.hashCode;
}
