import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultera_shopping/features/cart/presentation/cart_controller.dart';
import 'package:ultera_shopping/features/cart/presentation/cart_product_state.dart';
import 'package:ultera_shopping/features/products/data/product_repo.dart';
import 'package:ultera_shopping/features/products/domain/product.dart';
import 'package:ultera_shopping/utils/constants.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CartProduct> cartItems = ref.watch(cartItemsProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
        body: cartItems.isEmpty
            ? const _EmptyCart()
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: cartItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final CartProduct product = cartItems[index];
                        return _CartTile(item: product);
                      },
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Subtotal',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        Text(
                          '${Constants.currency}${ref.read(cartItemsProvider.notifier).getCartSubtotal()}',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _CartTile extends ConsumerWidget {
  final CartProduct item;

  const _CartTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(item.product.name),
      subtitle: Text(
        '${Constants.currency}${item.product.price.toStringAsFixed(0)}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (true)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      bool show =
                          ref
                              .watch(cartItemsProvider)
                              .firstWhere((element) => element == item)
                              .quantity >
                          1;

                      return Visibility(
                        visible: show,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: GestureDetector(
                            onTap: () => ref
                                .read(cartItemsProvider.notifier)
                                .decreaseQuanity(item),
                            child: Icon(Icons.remove, size: 16),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      item.quantity.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: GestureDetector(
                      onTap: () => ref
                          .read(cartItemsProvider.notifier)
                          .increaseQuantity(item),
                      child: Icon(Icons.add, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          IconButton(
            onPressed: () {
              ref
                  .read(cartItemsProvider.notifier)
                  .addOrRemoveFromCart(item.product);
            },
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            tooltip: 'Remove',
          ),
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 56,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 12),
          Text(
            'Your cart is empty',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
