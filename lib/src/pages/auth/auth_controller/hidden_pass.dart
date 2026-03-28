import 'package:get/get.dart';
class ObsecureController extends GetxController {
  var isPasswordHidden = true.obs;
  var isConfirmHidden = true.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirm() {
    isConfirmHidden.value = !isConfirmHidden.value;
  }
}