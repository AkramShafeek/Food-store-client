import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/loaders/animation_loader.dart';
import 'package:food_store/features/checkout/controllers/checkout_controller.dart';
import 'package:food_store/navigation_menu.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/pop_ups/loaders.dart';
import 'package:get/get.dart';

class PaymentProgressScreen extends StatelessWidget {
  const PaymentProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoadingController());
    return Scaffold(
      body: Center(
        // child: CircularProgressIndicator(
        //   strokeCap: StrokeCap.round,
        //   backgroundColor: AppColors.primary,
        //   color: AppColors.accent,
        // ),
        child: Obx(
          () => controller.showSuccess.value
              ? const AppAnimationLoaderWidget(
                  text: "", animation: AppImages.paymentSuccessful)
              : const CircularProgressIndicator(
                  backgroundColor: AppColors.primary,
                  color: AppColors.accent,
                  strokeCap: StrokeCap.round,
                ),
        ),
      ),
    );
  }
}

class LoadingController extends GetxController {
  RxBool showSuccess = true.obs;

  @override
  void onInit() {
    super.onInit();

    showSuccess.value = false;

    Future.delayed(const Duration(seconds: 3), () {
      showSuccess.value = true;
    });

    Future.delayed(const Duration(seconds: 4), () {
      AppLoaders.successSnackBar(
        color: Colors.green,
        title: "Order Placed!",
        message: "Your order has been placed successfully, Thank you",
      );
      Get.off(() => const BottomNavigationMenu());
      final checkoutController = Get.put(CheckoutController());
      checkoutController.placeOrder();
    });
  }
}
