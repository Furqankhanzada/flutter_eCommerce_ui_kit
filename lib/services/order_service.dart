import 'dart:convert';
import 'package:flutter_scaffold/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_scaffold/models/order.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderService {
  placeOrder(Order order, cart) async {
    final response = await http.post('$BASE_URL/wc-apis/v1/orders', body: {
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
