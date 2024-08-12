import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungconnectedapi/utility/app_controller.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> processGetImage({required ImageSource source}) async {
    var result = await ImagePicker()
        .pickImage(source: source, maxWidth: 800, maxHeight: 800);

    if (result != null) {
      File file = File(result.path);

      appController.files.add(file);
    }
  }
}
