import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/add_product_to_cart_model.dart';

class AddProductToCartService {
  Future<AddProductToCartModel> addProductToCart({
    required int productId,
    required int quantityWant,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/add_to_cart/$productId',
      body: {
        'quantity_want': quantityWant,
      },
      token: sharedPreferences!.getString("token"),
    );
    return AddProductToCartModel.fromJson(data);
  }
}
