class DeleteProductFromCartModel {
  final int status;
  final String message;
  final dynamic data;

  DeleteProductFromCartModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory DeleteProductFromCartModel.fromJson(Map<String, dynamic> json) {
    return DeleteProductFromCartModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'],
    );
  }
}
