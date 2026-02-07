import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../model/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate API delay

    final data = await rootBundle.loadString('assets/mock/user.json');
    final jsonData = json.decode(data);

    if (email == jsonData["email"] && password == jsonData["password"]) {
      return UserModel.fromJson(jsonData);
    }

    return null;
  }
}