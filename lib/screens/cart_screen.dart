import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final notifier = ref.read(cartProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white, // beyaz arka plan
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: cart.items.isEmpty
          ? const Center(
        child: Text('Your cart is empty', style: TextStyle(color: Colors.black)),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: cart.items.length,
              itemBuilder: (_, i) {
                final item = cart.items[i];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFEFEFEF),
                    child: Icon(Icons.fastfood, color: Colors.black87),
                  ),
                  title: Text(item.product.name,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    '${item.product.price.toStringAsFixed(2)} € x ${item.quantity}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.black),
                        onPressed: () => notifier.decrement(item.product),
                      ),
                      Text('${item.quantity}', style: const TextStyle(color: Colors.black)),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.black),
                        onPressed: () => notifier.add(item.product),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(height: 1),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _row('Subtotal', cart.subtotal),
                _row('Service fee', cart.serviceFee),
                _row('VAT ~7%', cart.vat),
                const Divider(),
                _row('Total', cart.total, isBold: true),
                const SizedBox(height: 12),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  ),
                  onPressed: () => context.go('/checkout'),
                  child: const Text('Proceed to Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.black, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text('${value.toStringAsFixed(2)} €',
              style: TextStyle(
                  color: Colors.black, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
