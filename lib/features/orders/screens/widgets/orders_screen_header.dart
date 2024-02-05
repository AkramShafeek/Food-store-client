import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/custom%20shapes/curved_card_image_edges.dart';
import 'package:food_store/features/orders/screens/widgets/orders_app_bar.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';

class OrderScreenHeader extends StatelessWidget {
  const OrderScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomImageCurvedEdges(),
      child: Container(
        width: double.infinity,
        height: 155,
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
            const Padding(
              padding: EdgeInsets.only(top: AppSizes.md),
              child: OrdersAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}
