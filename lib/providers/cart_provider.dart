import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartState {
  final List<CartItem> items;
  const CartState(this.items);

  double get subtotal => items.fold(0, (sum, e) => sum + e.lineTotal);
  double get serviceFee => subtotal == 0 ? 0 : 0.50;
  double get vat => subtotal * 0.07; // Almanya örneği: %7 yiyecek (örnek)
  double get total => subtotal + serviceFee + vat;
  int get totalQty => items.fold(0, (s, e) => s + e.quantity);
}

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState([]));

  void add(Product p, {int qty = 1}) {
    final i = state.items.indexWhere((e) => e.product.id == p.id);
    if (i == -1) {
      state = CartState([...state.items, CartItem(product: p, quantity: qty)]);
    } else {
      final current = state.items[i];
      final updated = current.copyWith(quantity: current.quantity + qty);
      final list = [...state.items]..[i] = updated;
      state = CartState(list);
    }
  }

  void decrement(Product p) {
    final i = state.items.indexWhere((e) => e.product.id == p.id);
    if (i == -1) return;
    final current = state.items[i];
    if (current.quantity == 1) {
      remove(p);
    } else {
      final updated = current.copyWith(quantity: current.quantity - 1);
      final list = [...state.items]..[i] = updated;
      state = CartState(list);
    }
  }

  void remove(Product p) {
    state = CartState(state.items.where((e) => e.product.id != p.id).toList());
  }

  void clear() => state = const CartState([]);
}

final cartProvider =
StateNotifierProvider<CartNotifier, CartState>((ref) => CartNotifier());
