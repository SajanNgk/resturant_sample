import 'package:get/get.dart';

class ProductVarientController extends GetxController {
  Rx<int> productVarientIndex = 0.obs;
  Rx<int> currentIndex = 0.obs;
  RxList<String> productVarientId = <String>[].obs;
  RxList<String> productVarientName = <String>[].obs;

  changeIndex(int value) {
    productVarientIndex.value = value;
  }

  changeCurrentIndex(int value) {
    currentIndex.value = value;
  }

  productVairentIDList(List<String> value) {
    productVarientId.value = value;
  }

  productVairentNameList(List<String> value) {
    productVarientName.value = value;
  }

  resetVarientIndex() {
    print("varient index reset");
    currentIndex.value = 0;

    productVarientIndex.value = 0;
    productVarientName.value = [];
    productVarientId.value = [];
  }
}
