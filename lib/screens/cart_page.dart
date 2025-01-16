// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/helper/api.dart';
import 'package:sara/models/confirm_order_model.dart';
import 'package:sara/models/show_cart_model.dart';
import 'package:sara/services/confirm_order_service.dart';
import 'package:sara/services/delete_product_from_cart_service.dart';
import 'package:sara/services/show_cart_service.dart';
import 'package:sara/services/update_cart_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> {
  Future<ShowCartModel> _fetchOrders() async {
    try {
      return await ShowCartService().showCart();
    } catch (e) {
      return ShowCartModel(
          status: 500, message: S.of(context).Errorfetchingorders, data: []);
    }
  }

  bool isLoading = false;

  void loadingIndicatorFalse() {
    setState(() {
      isLoading = false;
    });
  }

  void loadingIndicatorTrue() {
    setState(() {
      isLoading = true;
    });
  }

  // دالة لتأكيد الطلب
  Future<void> _confirmOrder() async {
    loadingIndicatorTrue();
    try {
      ConfirmOrderModel response = await ConfirmOrderService().confirmOrder();
      if (response.status == 200) {
        Get.snackbar(
          S.of(context).Success,
          response.message,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        // إعادة تحميل البيانات لتحديث الواجهة
        setState(() {});
      } else {
        Get.snackbar(
          S.of(context).Error,
          response.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        S.of(context).Error,
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      loadingIndicatorFalse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text(S.of(context).MyCart),
      ),
      body: FutureBuilder<ShowCartModel>(
        future: _fetchOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(S.of(context).ErrorloadingProducts));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            print("${S.of(context).Nodatafound}: ${snapshot.data!.data}");
            return Center(child: Text(S.of(context).Thereisnoproductincart));
          }

          final order = snapshot.data!.data;

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: order.map((product) {
                          return Customitemcartlist(
                            image: '$baseUrlImage/${product.image}',
                            name: product.name,
                            quantity: product.quantityWant,
                            totalQuantity: product.totalQuantity,
                            price: '${product.price}\$',
                            onUpdateQuantity: (newQuantity) async {
                              if (newQuantity > product.totalQuantity) {
                                Get.snackbar(
                                  S.of(context).Error,
                                  S.of(context).Quantityexceedsavailablestock,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                );
                              } else {
                                loadingIndicatorTrue();
                                try {
                                  await UpdateCartService().updateCart(
                                    orderDetailId: product.orderDetailId,
                                    newQuantity: newQuantity,
                                  );
                                  Get.snackbar(
                                    S.of(context).Success,
                                    S.of(context).Quantityupdatedsuccessfully,
                                    colorText: Colors.white,
                                    backgroundColor: Colors.green,
                                  );
                                } catch (e) {
                                  Get.snackbar(
                                    S.of(context).Error,
                                    e.toString(),
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red,
                                  );
                                } finally {
                                  loadingIndicatorFalse();
                                }
                              }
                            },
                            onDelete: () async {
                              loadingIndicatorTrue();
                              try {
                                await DeleteProductFromCartService()
                                    .deleteProductFromCart(
                                  productId: product.orderDetailId,
                                );
                                Get.snackbar(
                                  S.of(context).Hi,
                                  S
                                      .of(context)
                                      .Orderhasbeencanceledsuccessfully,
                                );
                              } catch (e) {
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
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              // زر تأكيد الطلب
              if (order.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _confirmOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Text(
                      S.of(context).ConfirmOrder,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class Customitemcartlist extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final int quantity;
  final int totalQuantity;
  final Future<void> Function(int newQuantity) onUpdateQuantity;
  final void Function()? onDelete;

  const Customitemcartlist({
    super.key,
    required this.name,
    required this.quantity,
    required this.totalQuantity,
    required this.price,
    required this.image,
    required this.onUpdateQuantity,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController quantityController =
        TextEditingController(text: quantity.toString());

    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ListTile(
              leading: Image.network(image),
              title: Text(name, style: const TextStyle(fontSize: 17)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: const TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                  Text('${S.of(context).Totalavailable}: $totalQuantity'),
                  TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: S.of(context).Quantity,
                    ),
                    onSubmitted: (value) async {
                      final newQuantity = int.tryParse(value) ?? quantity;
                      await onUpdateQuantity(newQuantity);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
