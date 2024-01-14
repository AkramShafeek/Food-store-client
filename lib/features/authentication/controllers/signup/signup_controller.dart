import 'package:flutter/material.dart';
import 'package:food_store/data/repositories/authentication/authentication_repository.dart';
import 'package:food_store/data/repositories/user/user_repository.dart';
import 'package:food_store/features/authentication/screens/signup/verify_email.dart';
import 'package:food_store/features/personalization/models/user_model.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/helper/network_manager.dart';
import 'package:food_store/utils/pop_ups/full_screen_loader.dart';
import 'package:food_store/utils/pop_ups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final phonenumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
        "We are processing your information",
        AppImages.loaderAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the firebase authentication
      final userCredentials = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredentials.user!.uid,
        firstname: firstname.text.trim(),
        lastname: lastname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phonenumber: phonenumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      // stop loading
      AppFullScreenLoader.stopLoading();

      // Show success message
      AppLoaders.successSnackBar(
          title: "Congratulations",
          message:
              "Your account has been created! Verify your email to continue");

      // navigate to verify email page
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
