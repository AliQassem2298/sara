// ignore_for_file: missing_required_param

import 'package:sara/helper/api.dart';
import 'package:sara/models/register_model.dart';

class RegisterService {
  Future<RegisterModel> register({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String phone,
    required String mylocation,
    required String password,
    required String passwordConfirmation,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/register',
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'user_name': userName,
        'email': email,
        'phone': phone,
        'location': mylocation,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );
    return RegisterModel.fromJson(data);
  }
}
