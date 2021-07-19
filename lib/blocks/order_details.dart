import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/services/order_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderBlock extends ChangeNotifier {
  OrderService _orderService = OrderService();
  // Index

  var _order;
  List<dynamic> _bankDetails = [];
  var _payment;

  get orderGetter => _order;
  set orderSetter(order) {
    _order = order;
    notifyListeners();
  }

  get bankDetailsGetter => _bankDetails;
  set bankDetailsSetter(bankDetails) {
    _bankDetails = bankDetails;
    notifyListeners();
  }

  get paymentGetter => _payment;
  set paymentSetter(payment) {
    _payment = payment;
    notifyListeners();
  }

  set setCart(cart) {
    _order['cart'] = cart;
  }


  set setBankDetails(bankDetails) {
    _order['account_details'] = bankDetails;
  }

  setOrderDetails(order) async {
    orderSetter = order;
  }

  setPaymentMethod(payment) async {
    paymentSetter = payment['title'];
    if (payment['title'] == 'Direct bank transfer') {
      bankDetailsSetter = payment['account_details'];
    } else {
      bankDetailsSetter = [];
    }
  }

  placeOrder(cart) async {
    final response = await _orderService.placeOrder(orderGetter, cart);
    if (response == 200) {
      Fluttertoast.showToast(
          msg: "Order has been placed successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      return Future.delayed(const Duration(milliseconds: 500), () {
        return response;
      });
    }
  }
}
