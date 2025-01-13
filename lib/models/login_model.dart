import 'package:sara/main.dart';

class LoginModel {
  final String message;
  final User user;
  final String location;
  final String token;

  LoginModel({
    required this.message,
    required this.user,
    required this.location,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    sharedPreferences!.setString("token", json['token']);

    return LoginModel(
      message: json['message'] as String,
      user: User.fromJson(json['user']),
      location: json['location'] as String,
      token: json['token'] as String,
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      userName: json['user_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
}
