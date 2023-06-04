import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// favorites_model.dart
class FavoritesModel extends ChangeNotifier {
  late Box<Color> _favoritesBox;
  bool _isReady = false;

  List<Color> get favorites {
    if (!_isReady) {
      return [];
    }

    return _favoritesBox.values.toList();
  }

  FavoritesModel() {
    _init();
  }

  Future<void> _init() async {
    _favoritesBox = await Hive.openBox<Color>('favorites');
    _isReady = true;
    notifyListeners();
  }

  void add(Color color) {
    if (!_isReady) return;

    if (!_favoritesBox.values.contains(color)) {
      _favoritesBox.add(color);
      notifyListeners();
    }
  }

  void remove(Color color) {
    if (!_isReady) return;

    final key =
        _favoritesBox.keyAt(_favoritesBox.values.toList().indexOf(color));
    if (key != null) {
      _favoritesBox.delete(key);
      notifyListeners();
    }
  }
}
