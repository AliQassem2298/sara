import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/show_products_by_store_id_model.dart';

class ShowProductsByStoreIdService {
  Future<ShowProductsByStoreIdModel> showProductByStoreId(
      {required int storeId}) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/show_store/$storeId',
      token: sharedPreferences!.getString("token"),
    );
    return ShowProductsByStoreIdModel.fromJson(data);
  }
}
