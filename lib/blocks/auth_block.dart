import 'package:flutter/material.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_scaffold/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBlock extends ChangeNotifier {
  final storage = FlutterSecureStorage();
  AuthBlock() {
    setUser();
  }
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

  // Loading
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool isUserExist) {
    _isLoggedIn = isUserExist;
    notifyListeners();
  }

  // user
  Map _user = {};
  Map get user => _user;
  setUser() async {
    _user = await _authService.getUser();
    isLoggedIn = _user == null ? false : true;
    notifyListeners();
  }

  login(UserCredential userCredential) async {
    await _authService.login(userCredential);
    setUser();
  }
  register(User user) async {
    await _authService.register(user);
  }
  logout() async{
    await storage.delete(key: 'user');
    isLoggedIn = false;
    notifyListeners();
  }
}
