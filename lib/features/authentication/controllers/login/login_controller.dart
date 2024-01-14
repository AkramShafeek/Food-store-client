import 'package:flutter/material.dart';
import 'package:food_store/data/repositories/authentication/authentication_repository.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/helper/network_manager.dart';
import 'package:food_store/utils/pop_ups/full_screen_loader.dart';
import 'package:food_store/utils/pop_ups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // read REMEMBER_ME_EMAIL if present in local storage
    if (localStorage.read("REMEMBER_ME_EMAIL") ?? false) {
      email.text = localStorage.read("REMEMBER_ME_EMAIL");
    }
    // read REMEMBER_ME_PASSWORD if present in local storage
    if (localStorage.read("REMEMBER_ME_PASSWORD") ?? false) {
      password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    }
    super.onInit();
  }

  Future<void> signin() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
        "Logging you in...",
        AppImages.loaderAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        localStorage.write('REMEMBER_ME_EMAIL', null);
        localStorage.write('REMEMBER_ME_PASSWORD', null);
      }

      // Signin user in the firebase authentication
      await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // stop loading
      AppFullScreenLoader.stopLoading();

      // redirect to home
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
