import 'dart:convert';
import 'package:flutter_ecommerce_ui_kit/config.dart';
import 'package:http/http.dart' as http;

class ProductService {
  getProducts() async {
    final response = await http.get(Uri.parse('$BASE_URL/tradebakerz/wc/v1/products?lang=en'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));
      return jsonDecode(response.body);
    } else {
      // If that call was not successful, throw an error.
//      throw Exception(response.body);
      return jsonDecode(response.body);
    }
  }

  getCurrencySymbol() async {
    final response = await http.get(Uri.parse('$BASE_URL/tradebakerz/wc/v1/currency'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));
      return jsonDecode(response.body);
    } else {
      // If that call was not successful, throw an error.
//      throw Exception(response.body);
      return jsonDecode(response.body);
    }
  }

  getNewArrivals() async {
    final response = await http.get(Uri.parse('$BASE_URL/tradebakerz/wc/v1/products/newarrival?lang=en'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));
      return jsonDecode(response.body);
    } else {
      // If that call was not successful, throw an error.
//      throw Exception(response.body);
      return jsonDecode(response.body);
    }
  }
}
