import 'package:flutter/foundation.dart';

enum ViewState { idle, loading, success, error }

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  String? _errorMessage;

  ViewState get state => _state;
  String? get errorMessage => _errorMessage;

  void setLoading() {
    _state = ViewState.loading;
    notifyListeners();
  }

  void setSuccess() {
    _state = ViewState.success;
    notifyListeners();
  }

  void setError(String message) {
    _errorMessage = message;
    _state = ViewState.error;
    notifyListeners();
  }

  void reset() {
    _state = ViewState.idle;
    _errorMessage = null;
    notifyListeners();
  }
}