import 'package:flutter/material.dart';

class ShareProvider with ChangeNotifier {
  List<Data> _data = [];

  List<Data> get data => _data;

  void setData(List<Data> newData) {
    _data = newData;
    notifyListeners();
  }
}

class Data {
  final String shlok;
  final String hindi;

  Data({required this.shlok, required this.hindi});
}
