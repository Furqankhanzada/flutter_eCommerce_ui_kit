import 'package:flutter/material.dart';
import 'package:flutter_scaffold/services/products_services.dart';

class ProductsBlock extends ChangeNotifier {
  ProductService _productService = ProductService();
  // Index
  List<dynamic> _products = [];
  List<dynamic> _newArrivals = [];
  get products => _products;
  get newArrivals => _newArrivals;
  set products(product) {
    _products = product;
    notifyListeners();
  }
  set newArrivals(newArrival) {
    _newArrivals = newArrival;
    notifyListeners();
  }
  getNewArrivals() async {
    final response = await _productService.getNewArrivals();
    print("new arrivals ====== $response");
    newArrivals = response;
  }
  getProducts() async {
    final response = await _productService.getProducts();
    products = response;
  }
}
