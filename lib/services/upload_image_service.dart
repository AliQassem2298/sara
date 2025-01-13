import 'dart:io';

import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/models/upload_image_model.dart';

class UploadImageService {
  Future<UploadImageModel> uploadProfileImage(File imageFile) async {
    final data = await Api().postMultipart(
      url: '$baseUrl/upload-image',
      imageFile: imageFile,
      token: sharedPreferences!.getString("token"),
    );
    return UploadImageModel.fromJson(data);
  }
}
