// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/helper/api.dart';
import 'package:sara/models/show_products_by_store_id_model.dart';
import 'package:sara/screens/cart_page.dart';
import 'package:sara/services/add_product_to_cart_service.dart';

class ProductDetailsPageFromStore extends StatefulWidget {
  const ProductDetailsPageFromStore({
    super.key,
    required this.product2,
    // required this.market,
  });
  final Product2 product2;
  // final ProductModel product;

  @override
  State<ProductDetailsPageFromStore> createState() =>
      _ProductDetailsPageFromStoreState();
}

class _ProductDetailsPageFromStoreState
    extends State<ProductDetailsPageFromStore> {
  int productCount = 1;
  RxBool isLoading = false.obs;

  void loadingIndicatorFalse() {
    isLoading.value = false;
    setState(() {});
  }

  void loadingIndicatorTrue() {
    isLoading.value = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // bool isMarketAvailable = widget.market.id != -1;

    return ModalProgressHUD(
      inAsyncCall: isLoading.value,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
            S.of(context).Product_Details,
            style: const TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    '$baseUrlImage/${widget.product2.imageUrl}',
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.product2.productName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product2.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${S.of(context).Price}: \$${widget.product2.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // const SizedBox(height: 10),
              // Text(
              //   'Amount: ${widget.product2.}',
              //   style: const TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.black,
              //   ),
              // ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("${S.of(context).Quantity_want}: "),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (productCount > 1) {
                              productCount--;
                            }
                          });
                        },
                      ),
                      Text(
                        productCount.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            productCount++;
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      loadingIndicatorTrue();

                      try {
                        await AddProductToCartService().addProductToCart(
                          productId: widget.product2.id,
                          quantityWant: productCount,
                        );

                        print('Success');
                        loadingIndicatorFalse();
                        Get.snackbar(
                          S.of(context).In_preparation,
                          S.of(context).Product_added_to_cart_successfully,
                        );
                      } catch (e) {
                        print(e.toString());
                        Get.snackbar(
                          S.of(context).Sorry,
                          e.toString(),
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                        );
                      }
                      loadingIndicatorFalse();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                    child: Text(
                      S.of(context).Add_to_Cart,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const CartPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                    child: Text(
                      S.of(context).Cart,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ).paddingOnly(top: 16)
            ],
          ),
        ),
      ),
    );
  }
}
