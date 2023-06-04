import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:munchmate/models/item.dart';
import 'package:munchmate/models/order.dart';

class User {
  final String id;
  final String name;
  final String email;
  final List<Item> favourites;
  final List<Order> lastOrders;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.favourites,
    required this.lastOrders,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    List<Item>? favourites,
    List<Order>? lastOrders,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      favourites: favourites ?? this.favourites,
      lastOrders: lastOrders ?? this.lastOrders,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'favourites': favourites.map((x) => x.toMap()).toList()});
    result.addAll({'lastOrders': lastOrders.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      favourites: List<Item>.from(map['favourites']?.map((x) => Item.fromMap(x))),
      lastOrders: List<Order>.from(map['lastOrders']?.map((x) => Order.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, favourites: $favourites, lastOrders: $lastOrders)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is User &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      listEquals(other.favourites, favourites) &&
      listEquals(other.lastOrders, lastOrders);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      favourites.hashCode ^
      lastOrders.hashCode;
  }
}
