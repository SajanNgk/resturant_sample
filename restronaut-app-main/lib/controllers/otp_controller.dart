import 'dart:async';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final RxString otp = ''.obs;
  final List<RxString> otpDigits = List.generate(5, (index) => ''.obs);
  final RxInt resendTimer = 0.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    startResendTimer();
  }

  void startResendTimer() {
    resendTimer.value = 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTimer.value > 0) {
        resendTimer.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    resendTimer.value = 60;
    timer.cancel();
    startResendTimer();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
