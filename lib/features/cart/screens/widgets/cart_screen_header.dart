import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/app%20bar/app_bar.dart';
import 'package:food_store/common/widgets/containers/primary_header_container.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';

class CartScreenHeader extends StatelessWidget {
  const CartScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryHeaderContainer(
      child: Column(
        children: [
          /// spacing from top of the screen
          const SizedBox(height: AppSizes.md),

          /// title
          CustomAppBar(
            showBackArrow: true,
            title: Text(
              "Your Cart",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: AppColors.white),
            ),
          ),

          /// Spacing to get a gap at the bottom of header
          const SizedBox(height: AppSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
