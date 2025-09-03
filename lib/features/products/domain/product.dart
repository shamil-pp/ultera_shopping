// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String name;
  final String id;
  final String imageLink;
  final double price;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageLink': imageLink,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      imageLink: map['imageLink'] as String,
      price: map['price'] as double,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  Product({
    required this.name,
    required this.imageLink,
    required this.price,
    required this.id,
  });

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.imageLink == imageLink &&
        other.price == price;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ imageLink.hashCode ^ price.hashCode;
  }
}
