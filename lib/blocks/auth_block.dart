import 'package:flutter/material.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_scaffold/services/auth_service.dart';

class AuthBlock extends ChangeNotifier {
  AuthService _authService = AuthService();
  // Index
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Loading
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool loadingState) {
    _loading = loadingState;
    notifyListeners();
  }

  login(UserCredential userCredential) {
    _authService.login(userCredential);
  }
}
