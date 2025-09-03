import 'dart:convert';

class Product {
  final String name;
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  Product({required this.name, required this.imageLink, required this.price});
}
