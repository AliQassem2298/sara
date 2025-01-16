import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/show_cart_model.dart';

class ShowCartService {
  Future<ShowCartModel> showCart() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/show_cart',
      token: sharedPreferences!.getString("token"),
    );
    return ShowCartModel.fromJson(data);
  }
}
