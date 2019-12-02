import 'package:flutter/material.dart';
import 'package:flutter_scaffold/models/order.dart';
import 'package:flutter_scaffold/services/order_service.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class OrderBlock extends ChangeNotifier {
  OrderService _orderService = OrderService();
  // Index
  var _order;
  get orderGetter => _order;
  set orderSetter(order) {
    _order = order;
    notifyListeners();
  }

  set setCart(cart) {
    _order['cart'] = cart;
  }

  setOrderDetails(order) async {
    orderSetter = order;
  }

  placeOrder(cart) async {
    final response = await _orderService.placeOrder(orderGetter, cart);
    if (response == 200) {
      Fluttertoast.showToast(
          msg: "Order has been placed successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          fontSize: 16.0
      );
      return Future.delayed(const Duration(milliseconds: 500), () {
        return response;
      });
    }
  }
}
