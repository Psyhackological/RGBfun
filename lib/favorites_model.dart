import 'package:flutter/material.dart';

class FavoritesModel extends ChangeNotifier {
  final List<Color> _favorites = [];

  List<Color> get favorites => _favorites;

  void add(Color color) {
    if (!_favorites.contains(color)) {
      _favorites.add(color);
      notifyListeners();
    }
  }

  void remove(Color color) {
    if (_favorites.contains(color)) {
      _favorites.remove(color);
      notifyListeners();
    }
  }
}
