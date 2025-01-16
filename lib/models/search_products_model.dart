import 'package:sara/models/show_products_by_store_id_model.dart';

class SearchProductsModel {
  final List<Product2> products;

  SearchProductsModel({required this.products});

  factory SearchProductsModel.fromJson(List<dynamic> json) {
    return SearchProductsModel(
        products:
            json.map((productJson) => Product2.fromJson(productJson)).toList());
  }
}
