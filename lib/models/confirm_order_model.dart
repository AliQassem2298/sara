class ConfirmOrderModel {
  final int status;
  final String message;
  final int data;

  ConfirmOrderModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ConfirmOrderModel.fromJson(Map<String, dynamic> json) {
    return ConfirmOrderModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'] as int,
    );
  }
}
