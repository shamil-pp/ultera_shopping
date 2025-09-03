import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultera_shopping/features/cart/presentation/cart_product_state.dart';
import 'package:ultera_shopping/features/products/domain/product.dart';

class CartController extends StateNotifier<List<CartProduct>> {
  CartController() : super([]); //intializes state (cart items empty by default)

  bool isProductInCart(Product product) {
    return state.any((cartItem) => cartItem.product == product);
  }

  void addOrRemoveFromCart(Product product) {
    if (isProductInCart(product)) {
      //already exists so remove
      state = state.where((e) => e.product != product).toList();
    } else {
      state = [...state, CartProduct(product: product, quantity: 1)];
    }
  }

  void increaseQuantity(CartProduct selectedItem) {
    state = state
        .map(
          (e) => e.product == selectedItem.product
              ? e.copyWith(
                  quantity: e.quantity + 1,
                ) //increase quantity of existing item
              : e,
        )
        .toList();
  }

  void decreaseQuanity(CartProduct selectedItem) {
    state = state
        .map(
          (e) => e.product == selectedItem.product
              ? e.copyWith(quantity: e.quantity - 1) //decrease quantity
              : e,
        )
        .toList();
  }

  String getCartSubtotal() {
    double subtotal = 0;
    for (CartProduct item in state) {
      subtotal += item.quantity * item.product.price;
    }

    return subtotal.toString();
  }
}

final cartItemsProvider =
    StateNotifierProvider<CartController, List<CartProduct>>((ref) {
      return CartController();
    });
