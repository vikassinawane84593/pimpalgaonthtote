import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pimpalgaonthote/servieces/profile_servise.dart';

class ImagePickerServise {

  ProfileServise profileServise = ProfileServise();

  final ImagePicker imagepicker = ImagePicker();

  Future <File?> imagePickerFun() async {

    final XFile? pickedimage = await imagepicker.pickImage(
        source: ImageSource.gallery
    );

    if(pickedimage != null){

      return File(pickedimage.path);
    }

    return null;

  }
}