import 'package:flutter/material.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppLoaders {
  static successSnackBar(
      {Color color = AppColors.primary, required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: color,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.check, color: AppColors.white));
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: AppColors.white));
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: AppColors.white));
  }
}
