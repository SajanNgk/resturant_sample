import 'package:get/get.dart';

class SearchTextController extends GetxController {
  Rx<String> searchText = "".obs;

  clearText() {
    searchText.value = "";
  }

  changeText(String text) {
    searchText.value = text;
  }
}
