import 'package:brahma_puran/model/data_model.dart';
import 'package:flutter/material.dart';

class JsonDataProvider extends ChangeNotifier {
  List<DataModel> data = [];

  void convertData(List<dynamic> jsonData) {
    data = jsonData.map((item) => DataModel.fromJson(item)).toList();
    notifyListeners();
  }
  DataModel getData(int index) {
    return data[index];
  }
}
