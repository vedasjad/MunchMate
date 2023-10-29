import 'dart:convert';

class Item {
  final String id;
  final String name;
  final String category;
  final int price;
  final String imageUrl;
  final bool isAvailable;
  final int lastUpdated;
  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
    required this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'category': category});
    result.addAll({'price': price});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'isAvailable': isAvailable});
    result.addAll({'lastUpdated': lastUpdated});
  
    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      price: map['price']?.toInt() ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      isAvailable: map['isAvailable'] ?? false,
      lastUpdated: map['lastUpdated']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  Item copyWith({
    String? id,
    String? name,
    String? category,
    int? price,
    String? imageUrl,
    bool? isAvailable,
    int? lastUpdated,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isAvailable: isAvailable ?? this.isAvailable,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, category: $category, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.name == name &&
      other.category == category &&
      other.price == price &&
      other.imageUrl == imageUrl &&
      other.isAvailable == isAvailable &&
      other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      category.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      isAvailable.hashCode ^
      lastUpdated.hashCode;
  }
}
