import 'package:flutter/material.dart';
import 'package:flutter_scaffold/models/order.dart';

class OrderBlock extends ChangeNotifier {
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
}
