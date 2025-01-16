// ignore_for_file: missing_required_param

import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/cancel_order_model.dart';

class CancelOrderService {
  Future<CancelOrderModel> cancelOrder({
    required int orderId,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/cancel_order/$orderId',
      token: sharedPreferences!.getString("token"),
    );
    return CancelOrderModel.fromJson(data);
  }
}
