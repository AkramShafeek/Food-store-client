import 'package:flutter/material.dart';
import 'package:food_store/common/product/cart/cart_menu_icon.dart';
import 'package:food_store/common/widgets/app%20bar/app_bar.dart';
import 'package:food_store/features/personalization/controllers/user_controller.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back!",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Obx(
            () => Text(
              controller.user.value.fullname,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AppColors.white),
            ),
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
        CartCounterIcon(
          onPressed: () {},
          iconColor: AppColors.white,
        ),
      ],
    );
  }
}
