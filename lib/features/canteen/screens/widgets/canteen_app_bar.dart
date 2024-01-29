import 'package:flutter/material.dart';
import 'package:food_store/common/product/cart/cart_menu_icon.dart';
import 'package:food_store/common/widgets/app%20bar/app_bar.dart';
import 'package:food_store/features/cart/screens/cart_screen.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CanteenAppBar extends StatelessWidget {
  const CanteenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose your favourite",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Text(
            "Canteen",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColors.white),
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
        CartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: AppColors.white,
        ),
      ],
    );
  }
}
