import 'package:flutter/material.dart';
import 'package:flutter_scaffold/services/cart_service.dart';

class CartBlock extends ChangeNotifier {
  CartService _cartService = CartService();
  // Index
  List<dynamic> _cartItems = [];
  get cartItems => _cartItems;
  set cartItems(cartItem) {
    _cartItems.add(cartItem);
    notifyListeners();
  }
  set removeCartItem(cartItem){
      _cartItems.removeWhere((item) => item["id"] == cartItem["id"]);
    notifyListeners();
  }
  getCartItems() async {
    final response = await _cartService.getCategories();
    cartItems = response;
  }
  addToCart(cartItem) async {
    List<dynamic> isItemAdded = cartItems.where((item) => item["id"] == cartItem["id"]).toList();
    if(isItemAdded.length == 0){
      cartItems = cartItem;
      notifyListeners();
    } else{
      removeCartItem = cartItem;
    }
  }
}
