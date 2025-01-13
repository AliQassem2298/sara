// ignore_for_file: missing_required_param

import 'package:sara/helper/api.dart';
import 'package:sara/models/login_model.dart';

class LoginService {
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/login',
      body: {
        'email': email,
        'password': password,
      },
    );
    return LoginModel.fromJson(data);
  }
}
