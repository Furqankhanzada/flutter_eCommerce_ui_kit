import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/services/categories_service.dart';

class CategoriesBlock extends ChangeNotifier {
  CategoriesBlock() {
    getCategories();
  }
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
