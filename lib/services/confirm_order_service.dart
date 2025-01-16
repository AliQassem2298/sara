// ignore_for_file: missing_required_param

import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/confirm_order_model.dart';

class ConfirmOrderService {
  Future<ConfirmOrderModel> confirmOrder() async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/confirm_order',
      token: sharedPreferences!.getString("token"),
    );
    return ConfirmOrderModel.fromJson(data);
  }
}
