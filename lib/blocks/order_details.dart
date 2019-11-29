import 'package:flutter/material.dart';
import 'package:flutter_scaffold/models/order.dart';
import 'package:flutter_scaffold/services/order_service.dart';

class OrderBlock extends ChangeNotifier {
    OrderService _orderService = OrderService();
  // Index
  var _order;
  get orderGetter => _order;
  set orderSetter(order) {
    _order = order;
    notifyListeners();
  }

  setOrderDetails(order) async {
    orderSetter = order;
  }
  placeOrder() async {
    await _orderService.placeOrder(orderGetter);
  }
}
