class AddProductToCartModel {
  final int status;
  final String message;
  final dynamic data;

  AddProductToCartModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory AddProductToCartModel.fromJson(Map<String, dynamic> json) {
    return AddProductToCartModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'],
    );
  }
}
