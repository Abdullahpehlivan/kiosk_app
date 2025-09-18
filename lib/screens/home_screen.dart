import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dpr = MediaQuery.of(context).devicePixelRatio;
    const heroFactor = 0.55; // daha büyük istersen 0.60 yap

    // Görselin ekranda kaplayacağı genişlik (sol/sağ padding = 16+16)
    final heroDecodeWidth = ((size.width - 32) * dpr).round();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: size.height * heroFactor,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/home_hero.jpg', // kendi dosya adınla eşleştir
                    fit: BoxFit.cover,
                    cacheWidth: heroDecodeWidth,   // performans için
                    errorBuilder: (_, __, ___) => const ColoredBox(
                      color: Color(0xFFEFEFEF),
                      child: Center(child: Icon(Icons.restaurant, size: 80, color: Colors.black54)),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const SizedBox(height: 32),
            const SizedBox(height: 48),

            Align(
              alignment: Alignment.center,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                ),
                onPressed: () => context.go('/menu'),
                child: const Text('Start Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
