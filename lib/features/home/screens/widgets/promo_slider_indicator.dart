import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/features/home/screens/widgets/promo_slider.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/helper/helper_functions.dart';

class SlideIndicator extends StatelessWidget {
  const SlideIndicator({
    super.key,
    required this.active,
    required this.index,
  });

  final int active;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = PromoSliderController.instance;
    return GestureDetector(
      onTap: () => controller.jumpToSlide(index),
      child: RoundedContainer(
        width: 25,
        height: 3,
        margin: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        backgroundColor: index == active
            ? AppColors.primary
            : AppHelperFunctions.isDarkMode(context)
                ? AppColors.darkGrey
                : AppColors.grey,
      ),
    );
  }
}
