import 'package:flutter/material.dart';
import 'package:food_store/features/cart/controllers/cart_controller.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Obx(
      () => Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            ),
          ),
          if (cartController.numberOfItems.value != 0)
            Positioned(
              right: 0,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    cartController.numberOfItems.value.toString(),
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: AppColors.white,
                          fontSizeFactor: 0.8,
                        ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
