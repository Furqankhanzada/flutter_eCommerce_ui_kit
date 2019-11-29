import 'package:flutter/material.dart';
import 'package:flutter_scaffold/services/cart_service.dart';

class PaymentBlock extends ChangeNotifier {
  CartService _paymentService = CartService();
  // Index
  List<dynamic> _payment = [];
  get payment => _payment;
  set payment(payment) {
    _payment = payment;
    notifyListeners();
  }
  getPayment() async {
    final response = await _paymentService.getPaymentMethods();
    payment = response;
  }
}
