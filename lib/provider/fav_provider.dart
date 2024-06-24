import 'package:flutter/material.dart';

import '../model/data_model.dart';

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
    if (isFavorite(item)) {
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
