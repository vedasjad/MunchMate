import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:munchmate/models/item.dart';

class Order {
  late String id;
  final List<Item> items;
  final List<int> itemCounts;
  late int totalPrice;
  final bool isDelivered;
  late int dateTime;
  late String orderedBy;
  Order({
    required this.id,
    required this.items,
    required this.itemCounts,
    required this.totalPrice,
    required this.isDelivered,
    required this.dateTime,
    required this.orderedBy,
  });

  Order copyWith({
    String? id,
    List<Item>? items,
    List<int>? itemCounts,
    int? totalPrice,
    bool? isDelivered,
    int? dateTime,
    String? orderedBy,
  }) {
    return Order(
      id: id ?? this.id,
      items: items ?? this.items,
      itemCounts: itemCounts ?? this.itemCounts,
      totalPrice: totalPrice ?? this.totalPrice,
      isDelivered: isDelivered ?? this.isDelivered,
      dateTime: dateTime ?? this.dateTime,
      orderedBy: orderedBy ?? this.orderedBy,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});
    result.addAll({'itemCounts': itemCounts});
    result.addAll({'totalPrice': totalPrice});
    result.addAll({'isDelivered': isDelivered});
    result.addAll({'dateTime': dateTime});
    result.addAll({'orderedBy': orderedBy});

    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      items: List<Item>.from(map['items']?.map((x) => Item.fromMap(x))),
      itemCounts: List<int>.from(map['itemCounts']),
      totalPrice: map['totalPrice'],
      isDelivered: map['isDelivered'] ?? false,
      dateTime: map['dateTime'],
      orderedBy: map['orderedBy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, items: $items, itemCounts: $itemCounts, totalPrice: $totalPrice, isDelivered: $isDelivered, dateTime: $dateTime, orderedBy: $orderedBy)';
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
        other.isDelivered == isDelivered &&
        other.dateTime == dateTime &&
        other.orderedBy == orderedBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        items.hashCode ^
        itemCounts.hashCode ^
        totalPrice.hashCode ^
        isDelivered.hashCode ^
        dateTime.hashCode ^
        orderedBy.hashCode;
  }
}
