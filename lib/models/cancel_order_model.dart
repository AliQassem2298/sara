class CancelOrderModel {
  final int status;
  final String message;
  final dynamic data;

  CancelOrderModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory CancelOrderModel.fromJson(Map<String, dynamic> json) {
    return CancelOrderModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'],
    );
  }
}
