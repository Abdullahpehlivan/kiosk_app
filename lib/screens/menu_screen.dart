import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/catalog_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_card.dart';
import '../widgets/cart_icon_button.dart'; // <-- EKLENDİ

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(catalogProvider);
    final foods = items.where((p) => p.category == 'Foods').toList();
    final drinks = items.where((p) => p.category == 'Drinks').toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Menu'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          actions: const [
            CartIconButton(iconColor: Colors.black), // <-- ROZETLİ SEPET
          ],
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Foods', icon: Icon(Icons.fastfood)),
              Tab(text: 'Drinks', icon: Icon(Icons.local_drink)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _CategoryGrid(items: foods),
            _CategoryGrid(items: drinks),
          ],
        ),
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  final List items;
  const _CategoryGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const Center(child: Text('No items'));

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .78,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => ProductCard(product: items[i]),
    );
  }
}
