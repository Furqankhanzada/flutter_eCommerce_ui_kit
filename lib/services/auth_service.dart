import 'dart:convert';

import 'package:flutter_scaffold/config.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final storage = FlutterSecureStorage();
  bool isLoggedIn = false;
  AuthService() {
    getUser();
  }
  // Create storage
  Future<Map> login(UserCredential userCredential) async {
    final response = await http.post('$BASE_URL/jwt-auth/v1/token', body: {
      'username': userCredential.usernameOrEmail,
      'password': userCredential.password
    });

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));
      setUser(response.body);
      print(response.body);
      return jsonDecode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception(response.body);
    }
  }

  setUser(String value) async {
    await storage.write(key: 'user', value: value);
  }

  getUser() async {
    String user = await storage.read(key: 'user');
    if (user?.isEmpty ?? true) {
      isLoggedIn = true;
      print(user);
      return jsonDecode(user);
    }
  }
}
