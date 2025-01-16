import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/search_products_model.dart';

class SearchProductsService {
  Future<SearchProductsModel> searchProdcuts({
    required String productName,
  }) async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/sersh_products?name=$productName',
      token: sharedPreferences!.getString("token"),
    );
    return SearchProductsModel.fromJson(data);
  }
}
