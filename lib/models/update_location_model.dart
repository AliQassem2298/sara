class UpdateLocationModel {
  final int status;
  final String message;
  final String data;

  UpdateLocationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateLocationModel.fromJson(Map<String, dynamic> json) {
    return UpdateLocationModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'] as String,
    );
  }
}
