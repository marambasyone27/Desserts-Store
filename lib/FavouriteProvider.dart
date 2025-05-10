import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maramstore/products%20information/Products_Information.dart';

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
    Products_Information.withIcon(Icons.favorite_border);
  }

  void removeByName(String name) {
  int index =   _favourites.indexWhere((item) => item['name'] == name); // Find the index of the item by its name(name);
  if (index != -1) {
    removeFromFavourites(index);
  }
}

}