import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 100, color: cs.secondary),
              const SizedBox(height: 16),
              const Text('Your order has been received!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Track your number on the screen. We will call you when it is ready.'),
              const SizedBox(height: 24),
              FilledButton(onPressed: () => context.go('/'), child: const Text('Back to Home')),
            ],
          ),
        ),
      ),
    );
  }
}
