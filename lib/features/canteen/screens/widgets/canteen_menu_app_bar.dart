import 'package:flutter/material.dart';
import 'package:food_store/common/product/cart/cart_menu_icon.dart';
import 'package:food_store/common/widgets/app%20bar/app_bar.dart';
import 'package:food_store/features/canteen/controllers/canteen_controller.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class CanteenMenuAppBar extends StatelessWidget {
  CanteenMenuAppBar({
    super.key,
  });

  final CanteenController controller = CanteenController.instance;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leadingIcon: Iconsax.arrow_left_2,
      iconColor: AppColors.white.withOpacity(0.7),
      leadingOnPressed: () {
        if (controller.showCanteenMenu.value) controller.closeCanteenMenu();
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.canteen.value,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Text(
            "Menu",
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
          onPressed: () {},
          iconColor: AppColors.white,
        ),
      ],
    );
  }
}
