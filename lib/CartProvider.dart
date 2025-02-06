import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  final List<Map<String, String>> _cartItems = [];

  List<Map<String, String>> get cartItems => _cartItems;

 
  void addToCart(String name, String picture, String price) {
    _cartItems.add({
      'name': name,
      'picture': picture,
      'price': price,
    });
    notifyListeners(); 
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}
