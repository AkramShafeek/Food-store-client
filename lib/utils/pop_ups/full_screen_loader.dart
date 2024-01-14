import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/loaders/animation_loader.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/helper/helper_functions.dart';
import 'package:get/get.dart';

class AppFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AppHelperFunctions.isDarkMode(Get.context!)
              ? AppColors.dark
              : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            const SizedBox(height: 250),
            AppAnimationLoaderWidget(text: text, animation: animation)
          ]),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
