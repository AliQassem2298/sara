class UploadImageModel {
  final bool status;
  final String message;
  final User user;
  final ImageData image;

  UploadImageModel({
    required this.status,
    required this.message,
    required this.user,
    required this.image,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      user: User.fromJson(json['user']),
      image: ImageData.fromJson(json['image']),
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      userName: json['user_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
}

class ImageData {
  final String imageUrl;
  final int id;

  ImageData({
    required this.imageUrl,
    required this.id,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      imageUrl: json['image_url'] as String,
      id: json['id'] as int,
    );
  }
}
