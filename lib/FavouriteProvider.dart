import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<Map<String, dynamic>> _favourites = [];

  List<Map<String, dynamic>> get favourites => _favourites;

  void addToFavourites(Map<String, dynamic> item) {
    _favourites.add(item);
    notifyListeners();  // Notify listeners after updating the list
  }

  void removeFromFavourites(int index) {
    _favourites.removeAt(index);
    notifyListeners();  // Notify listeners after removing an item
  }
}