import 'package:brahma_puran/model/data_model.dart';
import 'package:flutter/material.dart';

class Data {
  final String shlok;
  final String hindi;

  Data({required this.shlok, required this.hindi});
}

class FavProvider with ChangeNotifier {
  List<DataModel> _data = [];
  List<DataModel> _favorites = [];

  List<DataModel> get data => _data;
  List<DataModel> get favorites => _favorites;

  void setData(List<DataModel> newData) {
    _data = newData;
    notifyListeners();
  }

  void addToFavorites(DataModel item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(DataModel item) {
    return _favorites.contains(item);
  }
}
