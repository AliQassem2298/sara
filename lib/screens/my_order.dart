// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/models/show_orders_model.dart';
import 'package:sara/services/cancel_order_service.dart';
import 'package:sara/services/show_orders_service.dart';

class ShowOrdersPage extends StatefulWidget {
  const ShowOrdersPage({super.key});

  @override
  _ShowOrdersPageState createState() => _ShowOrdersPageState();
}

class _ShowOrdersPageState extends State<ShowOrdersPage> {
  late Future<ShowOrdersModel> _ordersFuture;
  final ShowOrdersService _ordersService = ShowOrdersService();

  @override
  void initState() {
    super.initState();
    _refreshOrders();
  }

  RxBool isLoading = false.obs;

  void loadingIndicatorFalse() {
    isLoading.value = false;
    setState(() {});
  }

  void loadingIndicatorTrue() {
    isLoading.value = true;
    setState(() {});
  }

  // دالة لإعادة جلب البيانات
  void _refreshOrders() {
    setState(() {
      _ordersFuture = _ordersService.showOrers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading.value,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          title: Text(S.of(context).MyOrders),
        ),
        body: FutureBuilder<ShowOrdersModel>(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                      '${S.of(context).Anerroroccurredwhilefetchingdata}: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
              return Center(
                child: Text(S.of(context).Therearenorequeststodisplay),
              );
            } else {
              final orders = snapshot.data!.data;
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('${S.of(context).TheOrder} #${order.id}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${S.of(context).TotalPrice}: ${order.totalPrice}'),
                          Text(
                              '${S.of(context).OrderDate}: ${order.orderDate.year}/${order.orderDate.month}/${order.orderDate.day}'),
                          Text(
                              '${S.of(context).Status}: ${_getStatusText(order.status)}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: order.status == '2'
                              ? Colors.grey
                              : Colors.red, // تغيير اللون عند التعطيل
                        ),
                        onPressed: order.status == '2'
                            ? null // تعطيل الزر إذا كانت الحالة ملغاة
                            : () async {
                                loadingIndicatorTrue();

                                try {
                                  await CancelOrderService()
                                      .cancelOrder(orderId: order.id);
                                  print('Success');
                                  Get.snackbar(
                                    S.of(context).Hi,
                                    S.of(context).Ordercancelledsuccessfully,
                                    backgroundColor: Colors.green,
                                  );

                                  // إعادة جلب البيانات بعد الإلغاء
                                  _refreshOrders();
                                } catch (e) {
                                  print(e.toString());
                                  Get.snackbar(
                                    S.of(context).Sorry,
                                    e.toString(),
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red,
                                  );
                                } finally {
                                  loadingIndicatorFalse();
                                }
                              },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  String _getStatusText(String status) {
    switch (status) {
      case '1':
        return S.of(context).Confirmed;
      case '2':
        return S.of(context).Canceled;
      default:
        return S.of(context).unknown;
    }
  }
}
