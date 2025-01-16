import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/show_all_stores_model.dart';

class ShowAllStoresService {
  Future<ShowAllStoreModel> showAllStores() async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/all_store',
      token: sharedPreferences!.getString("token"),
    );
    return ShowAllStoreModel.fromJson(data);
  }
}
