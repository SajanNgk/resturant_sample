import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hyperce/api/db/db_helper.dart';

class UserController extends GetxController {
  RxString username = "".obs;
  RxString idd = "".obs;
  RxBool isLoggedIn = false.obs;

  void setUserDetails(String name) {
    username.value = name;
  }

  void setImg(String img) {
    idd.value = img;
  }

  Future<void> checkLoggedInStatus() async {
    final loggedIn = await isUserLoggedIn();
    isLoggedIn.value = loggedIn;
  }

  Future<bool> isUserLoggedIn() async {
    final token =
        await Hive.box<String>(DatabaseHelper.authTokenDB).get("token");
    return token != null && token.isNotEmpty;
  }
}
