import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';

class ImagePickController extends GetxController {
  RxString imagePath = ''.obs;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: ImageSource.camera);
    if (_image != null) {
      imagePath.value = _image.path.toString();
    }
  }
}
