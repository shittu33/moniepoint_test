import 'package:moniepoint_test/core/data/dto/product_response.dart';

class User{
  final String id;
  final String name;
  final List<CartItem> cartItems;
  final List<String> messages;

  User({
    required this.id,
    required this.name,
    required this.cartItems,
    required this.messages,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    cartItems: (json['cartItems'] as List).map((e) => CartItem.fromJson(e)).toList(),
    messages: (json['messages'] as List).map((e) => e.toString()).toList(),
  );
}

class CartItem{
  final Product? product;
  final int quantity;

  CartItem({
     this.product,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    product: Product.fromJson(json['product']),
    quantity: json['quantity'],
  );
}