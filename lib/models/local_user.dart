import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:munchmate/models/item.dart';
import 'package:munchmate/models/order.dart';

class LocalUser {
  final String id;
  final String name;
  final String email;
  final String photoURL;
  final List<Item> favourites;
  List<Order> lastOrders;

  LocalUser({
    required this.id,
    required this.name,
    required this.email,
    required this.photoURL,
    required this.favourites,
    required this.lastOrders,
  });

  LocalUser copyWith({
    String? id,
    String? name,
    String? email,
    String? photoURL,
    List<Item>? favourites,
    List<Order>? lastOrders,
  }) {
    return LocalUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
      favourites: favourites ?? this.favourites,
      lastOrders: lastOrders ?? this.lastOrders,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'photoURL': photoURL});
    result.addAll({'favourites': favourites.map((x) => x.toMap()).toList()});
    result.addAll({'lastOrders': lastOrders.map((x) => x.toMap()).toList()});

    return result;
  }

  factory LocalUser.fromMap(Map<String, dynamic> map) {
    return LocalUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photoURL'] ?? '',
      favourites:
          List<Item>.from(map['favourites']?.map((x) => Item.fromMap(x))),
      lastOrders:
          List<Order>.from(map['lastOrders']?.map((x) => Order.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalUser.fromJson(String source) =>
      LocalUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocalUser(id: $id, name: $name, email: $email, photoURL: $photoURL, favourites: $favourites, lastOrders: $lastOrders)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is LocalUser &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.photoURL == photoURL &&
        listEquals(other.favourites, favourites) &&
        listEquals(other.lastOrders, lastOrders);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        photoURL.hashCode ^
        favourites.hashCode ^
        lastOrders.hashCode;
  }
}
