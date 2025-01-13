// ignore_for_file: missing_required_param

import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/logout_model.dart';

class LogoutService {
  Future<LogoutModel> logout() async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/logout',
      token: sharedPreferences!.getString("token"),
    );

    return LogoutModel.fromJson(data);
  }
}
