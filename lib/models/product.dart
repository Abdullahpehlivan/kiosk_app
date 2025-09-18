// lib/models/product.dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price; // EUR
  final String image;
  final String category;
  final List<String> tags;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    this.tags = const [],
  });
}
