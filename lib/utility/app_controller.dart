import 'dart:io';

import 'package:get/get.dart';

class AppController extends GetxController {
  RxList<File> files = <File>[].obs;

  RxBool display = false.obs;

  RxInt indexBody = 0.obs;
}
