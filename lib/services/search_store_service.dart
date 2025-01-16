import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/search_store_model.dart';

class SearchStoreService {
  Future<SearchStoreModel> searchStore({
    required String storeName,
  }) async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/sersh_stores?name=$storeName',
      token: sharedPreferences!.getString("token"),
    );
    return SearchStoreModel.fromJson(data);
  }
}
