import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/services/cart_service.dart';

class CartBlock extends ChangeNotifier {
  CartService _cartService = CartService();
  // Index
  List<dynamic> _cartItems = [];
  var _countries;
  var _state;
  get cartItems => _cartItems;
  get countries => _countries;
  get state => _state;
  set cartItems(cartItem) {
    _cartItems.add(cartItem);
    notifyListeners();
  }

  set countries(countries) {
    _countries = countries;
    notifyListeners();
  }

  set state(state) {
    _state = state;
    notifyListeners();
  }
  
  set removeCartItem(cartItem) {
    _cartItems.removeWhere((item) => item["id"] == cartItem["id"]);
    notifyListeners();
  }

  getCartItems() async {
    final response = await _cartService.getCategories();
    cartItems = response;
  }

  getCountries() async {
    final response = await _cartService.getCountries();
    countries = response;
  }

  getState(countryCode) async {
    state = null;
    final response = await _cartService.getState(countryCode);
    state = response;
  }

  emptyCart() async {
    _cartItems = [];
  }

  addToCart(cartItem) async {
    List<dynamic> isItemAdded =
        cartItems.where((item) => item["id"] == cartItem["id"]).toList();
    if (isItemAdded.length == 0) {
      cartItems = cartItem;
      notifyListeners();
    } else {
      removeCartItem = cartItem;
    }
  }
}
