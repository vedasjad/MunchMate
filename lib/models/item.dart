import 'dart:convert';

class Item {
  final String id;
  final String name;
  final String type;
  final String price;
  final String imageUrl;
  final String isAvailable;
  Item({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'type': type});
    result.addAll({'price': price});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'isAvailable': isAvailable});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      price: map['price'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      isAvailable: map['isAvailable'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  Item copyWith({
    String? id,
    String? name,
    String? type,
    String? price,
    String? imageUrl,
    String? isAvailable,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  String toString() {
    return 'Item(id: $id,type: $type, name: $name, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.isAvailable == isAvailable;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        isAvailable.hashCode;
  }
}
