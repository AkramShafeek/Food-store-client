import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Welcome to BMSCE store"),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          ElevatedButton(
            onPressed: () => controller.goToLoginPage(),
            style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            child: const Icon(
              Iconsax.arrow_right_3,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
