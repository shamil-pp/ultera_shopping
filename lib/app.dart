import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultera_shopping/features/cart/presentation/checkout_page.dart';
import 'package:ultera_shopping/features/products/presentation/product_list_page.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [const ProductListPage(), const CheckoutPage()];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: _BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;

  const _BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.storefront_outlined),
          activeIcon: Icon(Icons.storefront),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: badgedIcon(Icons.shopping_cart_outlined),

          activeIcon: badgedIcon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
    );
  }

  Widget badgedIcon(IconData icon) {
    return Badge(label: Text('1'), child: Icon(icon));
  }
}
