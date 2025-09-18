import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductCard extends ConsumerWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;

    // Kart genişliğine göre uygun decode genişliği (performans)
    final screenWidth = MediaQuery.of(context).size.width;
    final dpr = MediaQuery.of(context).devicePixelRatio;
    final cardWidth = (screenWidth - 24 - 12) / 2; // padding 12+12, spacing 12
    final baseTargetWidth = (cardWidth * dpr).round();

    final isDrink = product.category == 'Drinks';
    final fileName = product.image.split('/').last.toLowerCase();
    final isCola = fileName == 'cola.jpg' || product.name.toLowerCase().contains('cola');

    // Cola'yı biraz daha büyük göster: daha az padding + daha yüksek decode
    final drinkPadding = EdgeInsets.all(isCola ? 2 : 6);
    final targetWidth = isCola ? (baseTargetWidth * 1.2).round() : baseTargetWidth;

    return InkWell(
      onTap: () => context.go('/product/${product.id}'),
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: isDrink ? Colors.white : cs.secondary.withOpacity(.08),
                    child: Padding(
                      padding: isDrink ? drinkPadding : EdgeInsets.zero,
                      child: Image.asset(
                        product.image,                         // assets/images/...
                        fit: isDrink ? BoxFit.contain : BoxFit.cover,
                        alignment: Alignment.center,
                        cacheWidth: targetWidth,               // Cola için biraz daha büyük decode
                        errorBuilder: (_, __, ___) =>
                        const Center(child: Icon(Icons.fastfood, size: 48)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                '${product.price.toStringAsFixed(2)} €',
                style: const TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 8),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,  // siyah buton
                  foregroundColor: Colors.white,  // beyaz yazı
                ),
                onPressed: () => ref.read(cartProvider.notifier).add(product),
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
