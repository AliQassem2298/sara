import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/show_all_products_model.dart';

class ShowAllProductsService {
  Future<ShowAllProductsModel> showAllProducts() async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/all_products',
      token: sharedPreferences!.getString("token"),
    );
    return ShowAllProductsModel.fromJson(data);
  }
}
