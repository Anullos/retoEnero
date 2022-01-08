import 'dart:convert';

class ProductModel {
  final String id;
  final String name;
  final int price;
  final String urlPicture;
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.urlPicture,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    int? price,
    String? urlPicture,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      urlPicture: urlPicture ?? this.urlPicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'urlPicture': urlPicture,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      urlPicture: map['urlPicture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price, urlPicture: $urlPicture)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.urlPicture == urlPicture;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ urlPicture.hashCode;
  }
}
