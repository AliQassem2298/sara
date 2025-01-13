class UpdateProfileModel {
  final int status;
  final String message;
  final ProfileData data;

  UpdateProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: ProfileData.fromJson(json['data']),
    );
  }
}

class ProfileData {
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phone;

  ProfileData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phone,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      userName: json['user_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
}