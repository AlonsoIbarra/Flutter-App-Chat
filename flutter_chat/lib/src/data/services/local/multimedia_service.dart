import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MultimediaService {
  final ImagePicker picker;

  MultimediaService({ImagePicker? imagePicker})
      : picker = imagePicker ?? ImagePicker();

  Future<File?> selectImageFromLocalGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
