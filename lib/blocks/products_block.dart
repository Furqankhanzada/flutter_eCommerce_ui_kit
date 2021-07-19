import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/services/products_services.dart';

class ProductsBlock extends ChangeNotifier {
  ProductsBlock() {
    getNewArrivals();
  }
  ProductService _productService = ProductService();
  // Index
  List<dynamic> _products = [];
  String _currency = "";
  List<dynamic> _newArrivals = [];
  get products => _products;
  get currency => _currency;
  get newArrivals => _newArrivals;
  set currency(currency) {
    _currency = currency;
    notifyListeners();
  }
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
    final currencySymbolRes = await _productService.getCurrencySymbol();
    newArrivals = response;
    currency = currencySymbolRes;
  }

  getProducts() async {
    final response = await _productService.getProducts();
    products = response;
  }
}
