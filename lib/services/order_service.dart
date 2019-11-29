import 'dart:convert';
import 'package:flutter_scaffold/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_scaffold/models/order.dart';
import 'package:flutter/material.dart';

class OrderService {
  Future<Map>placeOrder(Order order) async {
    final obj = {
      "firstname" : order.firstname
    };

    final response = await http.post('$BASE_URL/wc-apis/v1/orders', body: obj);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // a
    } else {
      // if (response.statusCode == 403) {
      //   Fluttertoast.showToast(
      //       msg: "Invalid Credentials",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIos: 1,
      //       fontSize: 16.0);
      // }
      // If that call was not successful, throw an error.
//      throw Exception(response.body);
      return jsonDecode(response.body);
    }
  }
}
