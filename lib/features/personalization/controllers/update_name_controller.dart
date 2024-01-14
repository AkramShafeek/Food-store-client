import 'package:flutter/material.dart';
import 'package:food_store/data/repositories/user/user_repository.dart';
import 'package:food_store/features/personalization/controllers/user_controller.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/helper/network_manager.dart';
import 'package:food_store/utils/pop_ups/full_screen_loader.dart';
import 'package:food_store/utils/pop_ups/loaders.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstname;
    lastName.text = userController.user.value.lastname;
  }

  Future<void> updateUserName() async {
    try {
      /// Start loading
      AppFullScreenLoader.openLoadingDialog(
          "We are updating your information...", AppImages.loaderAnimation);

      /// check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      /// form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      /// Update user's first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      /// Update the Rx User Value
      userController.user.value.firstname = firstName.text.trim();
      userController.user.value.lastname = lastName.text.trim();

      /// Remove loader
      AppFullScreenLoader.stopLoading();

      /// show success message
      AppLoaders.successSnackBar(
          title: "Success", message: "Your name has been updated");

      /// Move to previous screen
      // Get.off(() => const ProfileScreen());
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
