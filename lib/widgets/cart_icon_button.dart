import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/cart_provider.dart';

class CartIconButton extends ConsumerWidget {
  final Color? iconColor;
  const CartIconButton({super.key, this.iconColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    // Sepetteki toplam adet (miktarları topla)
    final int count = cart.items.fold<int>(0, (sum, it) => sum + it.quantity);
    final String label = count > 99 ? '99+' : '$count';

    return IconButton(
      onPressed: () => context.go('/cart'),
      tooltip: 'Cart',
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(Icons.shopping_bag_outlined, color: iconColor),
          if (count > 0)
            Positioned(
              right: -4,
              top: -4,
              child: Container(
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE53935), // kırmızı rozet
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
