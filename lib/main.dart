// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/order_complete_screen.dart';

void main() {
  runApp(const ProviderScope(child: KioskApp()));
}

class KioskApp extends StatelessWidget {
  const KioskApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/menu', builder: (_, __) => const MenuScreen()),
        GoRoute(
          path: '/product/:id',
          builder: (_, s) => ProductDetailScreen(
            productId: s.pathParameters['id']!,
          ),
        ),
        GoRoute(path: '/cart', builder: (_, __) => const CartScreen()),
        GoRoute(path: '/checkout', builder: (_, __) => const CheckoutScreen()),
        GoRoute(path: '/done', builder: (_, __) => const OrderCompleteScreen()),
      ],
    );

    return MaterialApp.router(
      title: 'Kiosk',
      debugShowCheckedModeBanner: false,
      // Dijital görünüm için dark tema
      theme: AppTheme.dark(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
