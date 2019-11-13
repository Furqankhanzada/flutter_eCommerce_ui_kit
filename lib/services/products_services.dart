import 'dart:convert';
import 'package:flutter_scaffold/config.dart';
import 'package:http/http.dart' as http;

class ProductService {
  getProducts() async {
    final response = await http.get('$BASE_URL/wc-apis/v1/products?lang=ar');
    print(jsonDecode(response.body));
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
    final response = await http.get('$BASE_URL/wc-apis/v1/newarrivals?lang=ar');
    print(jsonDecode(response.body));
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
