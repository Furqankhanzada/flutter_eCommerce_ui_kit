import 'dart:convert';
import 'package:flutter_ecommerce_ui_kit/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ecommerce_ui_kit/models/order.dart';

class OrderService {
  placeOrder(Order order, cart) async {
    final response = await http.post(Uri.parse('$BASE_URL/wc-apis/v1/orders'), body: {
      'firstname': order.firstname,
      'lastname': order.lastname,
      'email': order.email,
      'phone': order.phone,
      'address': order.address,
      'city': order.city,
      'state': 'Sindh',
      'postalCode': order.postalCode,
      'country': 'Pakistan',
      'cart': jsonEncode(cart)
    });
     return response.statusCode;
  }
}
