import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void toggleFavorite(String fruitName) {
    if (_favorites.contains(fruitName)) {
      _favorites.remove(fruitName);
    } else {
      _favorites.add(fruitName);
    }
    notifyListeners();
  }

  bool isFavorite(String fruitName) {
    return _favorites.contains(fruitName);
  }
}
