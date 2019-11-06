import 'package:flutter/material.dart';
import 'package:flutter_scaffold/services/categories_service.dart';

class CategoriesBlock extends ChangeNotifier {
  CategoryService _categoryService = CategoryService();
  // Index
  List<dynamic> _categories = [];
  get categories => _categories;
  set categories(category) {
    _categories = category;
    notifyListeners();
  }
  getCategories() async {
   final response = await _categoryService.getCategories();
   categories = response;
  }
}
