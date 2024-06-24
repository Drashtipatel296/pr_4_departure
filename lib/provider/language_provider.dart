import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String selectedLanguage = "hindi";

  void updateSelectedLanguage(String value) {
    selectedLanguage = value;
    notifyListeners();
  }
}