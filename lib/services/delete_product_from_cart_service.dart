// ignore_for_file: missing_required_param

import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/delete_product_from_cart_model.dart';

class DeleteProductFromCartService {
  Future<DeleteProductFromCartModel> deleteProductFromCart({
    required int productId,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/delete_from_cart/$productId',
      token: sharedPreferences!.getString("token"),
    );
    return DeleteProductFromCartModel.fromJson(data);
  }
}
