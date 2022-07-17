import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/models/user.dart';
import 'package:flutter_ecommerce_ui_kit/services/auth_service.dart';

class AuthBlock extends ChangeNotifier {
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
  late String _loadingType;
  bool get loading => _loading;
  String get loadingType => _loadingType;
  set loading(bool loadingState) {
    _loading = loadingState;
    notifyListeners();
  }
  set loadingType(String loadingType) {
    _loadingType = loadingType;
    notifyListeners();
  }
  // Loading
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool isUserExist) {
    _isLoggedIn = isUserExist;
    notifyListeners();
  }

  // just in case if you want to see how logged in drawer would look like, uncomment _user and  comment _authService.getUser()
  // Map _user = {'user_email': 'furqan.khanzada@gmail.com', 'user_display_name': 'Muhammad Furqan'};
  Map _user = {};
  Map get user => _user;
  setUser() async {
    // _user = await _authService.getUser();
    isLoggedIn = _user.isNotEmpty ;
    notifyListeners();
  }

  login(UserCredential userCredential) async {
    loading = true;
    loadingType = 'login';
    await _authService.login(userCredential);
    setUser();
    loading = false;
  }

  register(User user) async {
    loading = true;
    loadingType = 'register';
    await _authService.register(user);
    loading = false;
  }

  logout() async {
    await _authService.logout();
    isLoggedIn = false;
    notifyListeners();
  }
}
