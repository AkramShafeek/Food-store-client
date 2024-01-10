import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/custom%20shapes/curved_card_image_edges.dart';
import 'package:food_store/features/canteen/controllers/canteen_controller.dart';
import 'package:food_store/features/canteen/screens/widgets/canteen_app_bar.dart';
import 'package:food_store/features/canteen/screens/widgets/canteen_menu_app_bar.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CanteenScreenHeader extends StatelessWidget {
  CanteenScreenHeader({
    super.key,
  });

  final CanteenController controller = CanteenController.instance;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomImageCurvedEdges(),
      child: Container(
        width: double.infinity,
        height: 150,
        color: AppColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -70,
              left: -70,
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(230),
                ),
              ),
            ),
            Positioned(
              top: -180,
              left: 20,
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(230),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSizes.md),
              child: Obx(() => controller.showCanteenMenu.value
                  ? CanteenMenuAppBar()
                  : const CanteenAppBar()),
            ),
          ],
        ),
      ),
    );
  }
}
