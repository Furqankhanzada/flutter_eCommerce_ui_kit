import 'package:flutter/material.dart';

class AuthBlock extends ChangeNotifier {
  // Index
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  // Loading
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool loadingState) {
    loading = loadingState;
    notifyListeners();
  }
}
