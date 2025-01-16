class SearchStoreModel {
  final List<Store> stores;

  SearchStoreModel({required this.stores});

  factory SearchStoreModel.fromJson(List<dynamic> json) {
    return SearchStoreModel(
        stores: json.map((storeJson) => Store.fromJson(storeJson)).toList());
  }
}

class Store {
  final int id;
  final String storeName;
  final String storeType;
  final String? address; // String? allows for null values
  final String imageUrl;

  Store({
    required this.id,
    required this.storeName,
    required this.storeType,
    this.address,
    required this.imageUrl,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] as int,
      storeName: json['store_name'] as String,
      storeType: json['store_type'] as String,
      address: json['address'] as String?, // Safe cast to String?
      imageUrl: json['image_url'] as String,
    );
  }
}
