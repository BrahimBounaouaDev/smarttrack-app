import 'package:flutter/material.dart';
import '../../../../core/base/base_provider.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/user_entity.dart';

class AuthProvider extends BaseProvider {
  final LoginUseCase loginUseCase;

  AuthProvider(this.loginUseCase);

  UserEntity? user;

  String email = "";
  String password = "";

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<bool> login() async {
    setLoading();

    final result = await loginUseCase(email, password);

    if (result != null) {
      user = result;
      setSuccess();
      return true;
    } else {
      setError("Invalid email or password");
      return false;
    }
  }
}