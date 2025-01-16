// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/show_all_stores_model.dart';
import 'package:sara/models/show_all_products_model.dart';
import 'package:sara/screens/product_details_page_from_all_products.dart';
import 'package:sara/screens/products_by_store_page.dart';
import 'package:sara/screens/search_page.dart';
import 'package:sara/services/show_all_stores_service.dart';
import 'package:sara/services/show_all_products_service.dart';
import 'package:sara/widgets/Custom_Drawer.dart';

class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(S.of(context).new_trend),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              print(sharedPreferences!.getString("token"));

              Get.to(() => const SearchPage());
            },
          ),

          // IconButton(
          //   icon: const Icon(Icons.delete),
          //   onPressed: () {
          //     sharedPreferences!.clear();
          //   },
          // ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).Stores,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: FutureBuilder<ShowAllStoreModel>(
                future: ShowAllStoresService().showAllStores(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Store> stores = snapshot.data!.stores;
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: stores.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15),
                      itemBuilder: (context, index) {
                        return CustomStoreCard(
                            onTap: () {
                              Get.to(() => ProductsByStorePage(
                                    storeId: stores[index].id,
                                  ));
                            },
                            store: stores[index]);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(S.of(context).Failed_to_load_stores));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).Products,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: FutureBuilder<ShowAllProductsModel>(
                future: ShowAllProductsService().showAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data!.products;
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                            onTap: () {
                              Get.to(() => ProductDetailsPageFromAllProducts(
                                    product: products[index],
                                  ));
                            },
                            product: products[index]);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(S.of(context).Failed_to_load_products));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStoreCard extends StatelessWidget {
  CustomStoreCard({
    super.key,
    required this.store,
    required this.onTap,
  });
  final Store store;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        height: 120,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('$baseUrlImage/${store.imageUrl}',
                  height: 100, width: 100),
              Text(store.storeName,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProductCard extends StatelessWidget {
  CustomProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });
  final Product product;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('$baseUrlImage/${product.images.first.imageUrl}',
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
