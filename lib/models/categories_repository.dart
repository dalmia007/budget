import 'package:flutter/material.dart';

class CategoriesRepository with ChangeNotifier {
  static Map<String, String> categories = {
    "0": "Unknown",
    "1": "Travel",
    "2": "Food",
    "3": "Clothes"
  };

  CategoriesRepository();
  Map<String, String> getCategories() {
    return categories;
  }

  addCategory(String categoryName) {
    int categoryId = categories.length + 1;
    categories.putIfAbsent(categoryId.toString(), () => categoryName);
    notifyListeners();
    return categoryId.toString();
  }

  void removeCategory(String categoryId) {
    categories.remove(categoryId);
    notifyListeners();
  }
}
