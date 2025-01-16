class UpdateCartModel {
  final int status;
  final String message;
  final dynamic data;

  UpdateCartModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory UpdateCartModel.fromJson(Map<String, dynamic> json) {
    return UpdateCartModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'],
    );
  }
}
