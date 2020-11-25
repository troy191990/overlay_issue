import 'package:flutter/material.dart';

class BaseVM extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  bool _apiError = false;
  bool get apiError => _apiError;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void setError(bool value) {
    _apiError = value;
    notifyListeners();
  }
}
