import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/update_profile_model.dart';

class UpdateProfileService {
  Future<UpdateProfileModel> updateProfile({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String phone,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/update_profile',
      body: {
        "first_name": firstName,
        "last_name": lastName,
        "user_name": userName,
        "email": email,
        "phone": phone,
      },
      token: sharedPreferences!.getString("token"),
    );
    return UpdateProfileModel.fromJson(data);
  }
}

// import 'package:sara/helper/api.dart';
// import 'package:sara/main.dart';
// import 'package:sara/models/update_profile_model.dart';

// class UpdateProfileService {
//   Future<UpdateProfileModel> updateProfileField({
//     required String field,
//     required String value,
//   }) async {
//     Map<String, dynamic> data = await Api().post(
//       url: '$baseUrl/update_profile',
//       body: {
//         field: value,
//       },
//       token: sharedPreferences!.getString("token"),
//     );
//     return UpdateProfileModel.fromJson(data);
//   }
// }
