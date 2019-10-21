import 'dart:convert';

import 'package:flutter_scaffold/config.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<http.Response> login() async {
    final response = await http.post('$BASE_URL/jwt-auth/v1/token');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));
      return jsonDecode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
