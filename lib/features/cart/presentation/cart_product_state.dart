// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ultera_shopping/features/products/domain/product.dart';

class CartProduct {
  final Product product;
  final int quantity;

  CartProduct({required this.product, required this.quantity});

  CartProduct copyWith({Product? product, int? quantity}) {
    return CartProduct(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(covariant CartProduct other) {
    if (identical(this, other)) return true;

    return other.product == product && other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
