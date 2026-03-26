import 'package:get/get.dart';
class ObsecureController extends GetxController{
  var isHidden = true.obs;

  void toggle() {
    isHidden.value = !isHidden.value;
  }
}