// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/helper/api.dart';
import 'package:sara/models/search_products_model.dart';
import 'package:sara/models/search_store_model.dart';
import 'package:sara/models/show_products_by_store_id_model.dart';
import 'package:sara/screens/product_details_page_from_store.dart';
import 'package:sara/screens/products_by_store_page.dart';
import 'package:sara/services/search_products_service.dart';
import 'package:sara/services/search_store_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchType = 'product'; // Default search type
  final TextEditingController _searchController = TextEditingController();
  List<Product2> _products = [];
  List<Store> _stores = [];

  @override
  void initState() {
    super.initState();
    _fetchAllData(); // Fetch all data when the page loads
  }

  Future<void> _fetchAllData() async {
    if (_searchType == 'product') {
      await _fetchAllProducts();
    } else {
      await _fetchAllStores();
    }
  }

  Future<void> _fetchAllProducts() async {
    SearchProductsService service = SearchProductsService();
    SearchProductsModel result = await service.searchProdcuts(productName: '');
    setState(() {
      _products = result.products;
      _stores = [];
    });
  }

  Future<void> _fetchAllStores() async {
    SearchStoreService service = SearchStoreService();
    SearchStoreModel result = await service.searchStore(storeName: '');
    setState(() {
      _stores = result.stores;
      _products = [];
    });
  }

  Future<void> _search() async {
    if (_searchController.text.isEmpty) {
      await _fetchAllData(); // Fetch all data if search field is empty
      return;
    }

    if (_searchType == 'product') {
      SearchProductsService service = SearchProductsService();
      SearchProductsModel result = await service.searchProdcuts(
        productName: _searchController.text,
      );
      setState(() {
        _products = result.products;
        _stores = [];
      });
    } else {
      SearchStoreService service = SearchStoreService();
      SearchStoreModel result = await service.searchStore(
        storeName: _searchController.text,
      );
      setState(() {
        _stores = result.stores;
        _products = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(S.of(context).Search),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${S.of(context).Searchby}:'),
              Radio(
                value: S.of(context).product,
                groupValue: _searchType,
                onChanged: (value) {
                  setState(() {
                    _searchType = value.toString();
                    _fetchAllData(); // Fetch data when search type changes
                  });
                },
              ),
              Text(S.of(context).product),
              Radio(
                value: S.of(context).store,
                groupValue: _searchType,
                onChanged: (value) {
                  setState(() {
                    _searchType = value.toString();
                    _fetchAllData(); // Fetch data when search type changes
                  });
                },
              ),
              Text(S.of(context).store),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: S.of(context).Search,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _search,
                ),
              ),
              onChanged: (value) => _search(), // Search on pressing Enter
            ),
          ),
          Expanded(
            child: _searchType == 'product'
                ? _buildProductCards()
                : _buildStoreCards(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCards() {
    if (_products.isEmpty) {
      return Center(
        child: Text(
          S.of(context).Therearenoproductswiththisname,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        Product2 product = _products[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // Navigate to product details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPageFromStore(
                    product2: product,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '$baseUrlImage/${product.imageUrl}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(product.description),
                  const SizedBox(height: 5),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('${S.of(context).Quantity}: ${product.amount}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStoreCards() {
    if (_stores.isEmpty) {
      return Center(
        child: Text(
          S.of(context).Therearenostoreswiththisname,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: _stores.length,
      itemBuilder: (context, index) {
        Store store = _stores[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // Navigate to products by store page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsByStorePage(
                    storeId: store.id,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '$baseUrlImage/${store.imageUrl}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    store.storeName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(store.storeType),
                  const SizedBox(height: 5),
                  Text(
                    store.address ?? S.of(context).NoAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
