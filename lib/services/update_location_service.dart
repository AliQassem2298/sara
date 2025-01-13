import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/update_location_model.dart';

class UpdateLocationService {
  Future<UpdateLocationModel> updateLocation({
    required String address,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/add_Location',
      body: {
        'address': address,
      },
      token: sharedPreferences!.getString("token"),
    );

    return UpdateLocationModel.fromJson(data);
  }
}
