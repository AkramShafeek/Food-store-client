import 'package:flutter/material.dart';
import 'package:food_store/common/texts/section_heading.dart';
import 'package:food_store/common/widgets/containers/primary_header_container.dart';
import 'package:food_store/features/home/screens/widgets/home_app_bar.dart';
import 'package:food_store/features/home/screens/widgets/previously_ordered_lists.dart';
import 'package:food_store/features/home/screens/widgets/promo_slider.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/image_strings.dart';
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
                  const SizedBox(height: AppSizes.md),
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
                  const SizedBox(height: AppSizes.spaceBtwSections + 30),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(AppSizes.sm),
              child: Column(
                children: [
                  SizedBox(height: AppSizes.spaceBtwItems),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                    child: SectionHeading(
                      title: "Popular choices",
                      showActionButton: false,
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.md),
                    child: PromoSlider(slides: [
                      {
                        "image": AppImages.vegFriedMaggi2,
                        "name": "Veg Fired Maggi",
                        "canteen": "Gowda Canteen"
                      },
                      {
                        "image": AppImages.nescafeCanteen,
                        "name": "Hot Coffee",
                        "canteen": "Nescafe"
                      },
                      {
                        "image": AppImages.vegFriedMaggi,
                        "name": "Veg Fired Maggi",
                        "canteen": "Vidyarthi Khana"
                      },
                    ]),
                  ),
                  // PopularItemCard(image: AppImages.vegFriedMaggi),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                    child: SectionHeading(
                      title: "Previously ordered",
                      showActionButton: false,
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  PreviouslyOrderedItemsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
