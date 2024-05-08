import 'package:get/get.dart';

class OurCollectionController extends GetxController {
  RxList<String> collectionID = <String>[].obs;
  RxList<String> collectionSlug = <String>[].obs;
  RxList<String> collectionName = <String>[].obs;

  collectionIDAdd(List<String> value) {
    collectionID.value = value;
  }

  collectionSlugAdd(List<String> value) {
    collectionSlug.value = value;
  }

  collectionNameAdd(List<String> value) {
    collectionName.value = value;
  }
}
