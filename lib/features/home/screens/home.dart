import 'package:flutter/material.dart';
import 'package:food_store/common/product/item_cards/previously_ordered_card.dart';
import 'package:food_store/common/texts/section_heading.dart';
import 'package:food_store/common/widgets/containers/primary_header_container.dart';
import 'package:food_store/features/home/screens/widgets/home_app_bar.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultSpace),
                    child: Container(
                      width: AppDeviceUtils.getScreenWidth(context),
                      padding: const EdgeInsets.all(AppSizes.md),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Iconsax.search_normal,
                            color: AppColors.grey,
                          ),
                          SizedBox(width: AppSizes.md),
                          Text(
                            "Search",
                            style: TextStyle(color: AppColors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: SectionHeading(
                title: "Previously ordered",
                showActionButton: false,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            const PreviouslyOrderedCard(
              foodName: "Veg fried maggi",
              canteenName: "Vidhyarthi Khana",
              price: 50,
            ),
            const SizedBox(height: AppSizes.sm),
            const PreviouslyOrderedCard(
              foodName: "Veg fried maggi",
              canteenName: "Vidhyarthi Khana",
              price: 50,
            ),
            const SizedBox(height: AppSizes.sm),
            const PreviouslyOrderedCard(
              foodName: "Veg fried maggi",
              canteenName: "Vidhyarthi Khana",
              price: 50,
            ),
            const SizedBox(height: AppSizes.sm),
          ],
        ),
      ),
    );
  }
}
