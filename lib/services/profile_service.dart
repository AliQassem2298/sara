import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/profile_model.dart';

class ProfileService {
  Future<ProfileModel> profile() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/user_profile',
      token: sharedPreferences!.getString("token"),
    );
    return ProfileModel.fromJson(data);
  }
}
