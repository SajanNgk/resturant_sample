import 'package:get/get.dart';

class OurTabController extends GetxController {
  Rx<int> index = 0.obs;

  void changeIndex(int value) {
    index.value = value;
  }

  initialize() {
    index.value = 0;
  }
}
