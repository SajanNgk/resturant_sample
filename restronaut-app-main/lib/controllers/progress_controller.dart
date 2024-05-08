import 'package:get/get.dart';

class ProgressController extends GetxController {
  Rx<bool> progress = false.obs;

  changeValue(bool value) {
    progress.value = value;
    print("Progress value changed to: $value");
  }
}
