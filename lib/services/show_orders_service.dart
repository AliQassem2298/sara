import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/show_orders_model.dart';

class ShowOrdersService {
  Future<ShowOrdersModel> showOrers() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/get_orders',
      token: sharedPreferences!.getString("token"),
    );
    return ShowOrdersModel.fromJson(data);
  }
}
