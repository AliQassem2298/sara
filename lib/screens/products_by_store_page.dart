// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/helper/api.dart';
import 'package:sara/models/show_products_by_store_id_model.dart';
import 'package:sara/screens/product_details_page_from_store.dart';
import 'package:sara/services/show_products_by_store_id_service.dart';

class ProductsByStorePage extends StatelessWidget {
  final int storeId;

  const ProductsByStorePage({
    super.key,
    required this.storeId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: FutureBuilder<ShowProductsByStoreIdModel>(
          future: ShowProductsByStoreIdService()
              .showProductByStoreId(storeId: storeId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(
                title: Text(snapshot.data!.storeName),
                subtitle: Text(snapshot.data!.address),
                leading:
                    Image.network('$baseUrlImage/${snapshot.data!.imageUrl}'),
              );
            } else {
              return Text(S.of(context).Loading);
            }
          },
        ),
      ),
      body: FutureBuilder<ShowProductsByStoreIdModel>(
        future: ShowProductsByStoreIdService()
            .showProductByStoreId(storeId: storeId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product2> products = snapshot.data!.products;
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CustomDetailsProductCard(
                  product: products[index],
                  onTap: () {
                    Get.to(() => ProductDetailsPageFromStore(
                          product2: products[index],
                        ));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text(S.of(context).Failed_to_load_products));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class CustomDetailsProductCard extends StatelessWidget {
  CustomDetailsProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });
  final Product2 product;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('$baseUrlImage/${product.imageUrl}',
                height: 100, width: 100),
            Text(product.productName,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
