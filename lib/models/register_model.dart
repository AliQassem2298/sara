import 'package:sara/main.dart';

class RegisterModel {
  final int status;
  final String message;
  final User user;

  RegisterModel({
    required this.status,
    required this.message,
    required this.user,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'] as int,
      message: json['message'] as String,
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phone;
  final int id;
  final String token;
  final String location;

  User({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phone,
    required this.id,
    required this.token,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    sharedPreferences!.setString("token", json['token']);

    return User(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      userName: json['user_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      id: json['id'] as int,
      token: json['token'] as String,
      location: json['location'] as String,
    );
  }
}
