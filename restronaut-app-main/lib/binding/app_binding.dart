import 'package:get/get.dart';
import 'package:hyperce/controllers/mero_product_controller.dart';
import 'package:hyperce/controllers/otp_controller.dart';
import 'package:hyperce/controllers/username_controller.dart';

import '../controllers/controllers.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductVarientController(),
    ); // Handles product variants.
    Get.lazyPut(
      () => SearchTextController(),
    ); // Manages search text state.
    Get.lazyPut(
      () => ProgressController(),
    ); // Manages application progress.
    Get.lazyPut(
      () => CartAnimationController(),
    ); // Manages cart animations.
    Get.lazyPut(
      () => OurTabController(),
    ); // Controls tab navigation.
    Get.lazyPut(
      () => OurCollectionController(),
    );
    Get.lazyPut(
      () => UserController(),
    );
    Get.lazyPut(
      () => OTPController(),
    );
    Get.lazyPut(
      () => ProductController(),
    );
  }
  // OurTabController
  // ProgressController
  // CartAnimationController
}
