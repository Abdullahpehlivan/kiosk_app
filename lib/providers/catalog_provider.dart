import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

// Uses your actual files in assets/images/
final catalogProvider = Provider<List<Product>>((ref) {
  return const [
    // ===== FOODS (6) =====
    Product(
      id: 'f1',
      name: 'Classic Burger',
      description: 'Beef patty, cheese, lettuce, tomato.',
      price: 6.90,
      image: 'assets/images/classic.jpg',
      category: 'Foods',
    ),
    Product(
      id: 'f2',
      name: 'Double Burger',
      description: 'Two beef patties, cheddar, special sauce.',
      price: 8.90,
      image: 'assets/images/double.jpeg',
      category: 'Foods',
    ),
    Product(
      id: 'f3',
      name: 'Chicken Burger',
      description: 'Crispy chicken fillet, mayo, lettuce.',
      price: 6.50,
      image: 'assets/images/chicken.jpg',
      category: 'Foods',
    ),
    Product(
      id: 'f4',
      name: 'Beef Döner',
      description: 'Juicy beef döner with onions.',
      price: 8.20,
      image: 'assets/images/beef.jpg',
      category: 'Foods',
    ),
    Product(
      id: 'f5',
      name: 'Chicken Döner',
      description: 'Grilled chicken döner, garlic sauce.',
      price: 7.50,
      image: 'assets/images/chickendöner.jpeg',
      category: 'Foods',
    ),
    Product(
      id: 'f6',
      name: 'French Fries',
      description: 'Golden & crispy fries.',
      price: 2.90,
      image: 'assets/images/frenchfries.jpg',
      category: 'Foods',
    ),

    // ===== DRINKS (6) =====
    Product(
      id: 'd1',
      name: 'Coca-Cola',
      description: 'Refreshing classic cola.',
      price: 2.50,
      image: 'assets/images/cola.jpg',
      category: 'Drinks',
    ),
    Product(
      id: 'd2',
      name: 'Fanta',
      description: 'Orange soda.',
      price: 2.50,
      image: 'assets/images/fanta.jpg',
      category: 'Drinks',
    ),
    Product(
      id: 'd3',
      name: 'Sprite',
      description: 'Lemon-lime soda.',
      price: 2.50,
      image: 'assets/images/sprite.jpg',
      category: 'Drinks',
    ),
    Product(
      id: 'd4',
      name: 'Iced Tea',
      description: 'Peach iced tea.',
      price: 2.20,
      image: 'assets/images/icetea.jpg',
      category: 'Drinks',
    ),
    Product(
      id: 'd5',
      name: 'Still Water',
      description: 'Bottled still water.',
      price: 1.20,
      image: 'assets/images/stillwater.jpg',
      category: 'Drinks',
    ),
    Product(
      id: 'd6',
      name: 'Coffee',
      description: 'Hot brewed coffee.',
      price: 2.00,
      image: 'assets/images/coffee.jpg',
      category: 'Drinks',
    ),
  ];
});

// Only two tabs
final categoriesProvider =
Provider<List<String>>((ref) => const ['Foods', 'Drinks']);
