import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/update_cart_model.dart';

class UpdateCartService {
  Future<UpdateCartModel> updateCart({
    required int orderDetailId,
    required int newQuantity,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/update_cart/$orderDetailId',
      body: {
        'new_quantity': newQuantity,
      },
      token: sharedPreferences!.getString("token"),
    );
    return UpdateCartModel.fromJson(data);
  }
}
