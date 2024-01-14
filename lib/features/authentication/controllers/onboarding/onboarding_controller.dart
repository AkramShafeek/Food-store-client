import 'package:food_store/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  void goToLoginPage() {
    final storage = GetStorage();
    storage.write('isFirstTime', false);
    Get.offAll(() => const LoginScreen());
  }
}
