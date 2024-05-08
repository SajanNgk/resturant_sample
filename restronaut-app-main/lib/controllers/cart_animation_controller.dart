import 'package:get/get.dart';

class CartAnimationController extends GetxController {
  Rx<bool> state = false.obs;
  toggleValue() {
    state.value = !state.value;
  }
}
