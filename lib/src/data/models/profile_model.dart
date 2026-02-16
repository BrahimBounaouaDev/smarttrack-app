import 'package:smarttoil/src/domain/entities/profile.dart';

class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String company;
  final String role;
  final String avatar;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.company,
    required this.role,
    required this.avatar,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      company: json['company'],
      role: json['role'],
      avatar: json['avatar'],
    );
  }

  Profile toEntity() {
    return Profile(
      id: id,
      name: name,
      email: email,
      phone: phone,
      company: company,
      role: role,
      avatar: avatar,
    );
  }
}