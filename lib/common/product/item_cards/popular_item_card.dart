import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/containers/curved_image_container.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/helper/helper_functions.dart';

class PopularItemCard extends StatelessWidget {
  const PopularItemCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedContainer(
        padding: const EdgeInsets.all(AppSizes.xs),
        radius: AppSizes.md,
        backgroundColor: isDarkMode ? AppColors.dark : AppColors.light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CurvedImageContainer(
                height: 180,
                width: double.infinity,
                image: image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.lg,
                left: AppSizes.lg,
                bottom: AppSizes.lg,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Veg Fried Maggi",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        "Vidyarti Khana",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  // Text("Rs. 50", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
