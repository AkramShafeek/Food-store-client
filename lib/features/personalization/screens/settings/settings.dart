import 'package:flutter/material.dart';
import 'package:food_store/common/texts/section_heading.dart';
import 'package:food_store/common/widgets/app%20bar/app_bar.dart';
import 'package:food_store/common/widgets/containers/primary_header_container.dart';
import 'package:food_store/common/widgets/list_tiles/app_profile_tile.dart';
import 'package:food_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:food_store/data/repositories/authentication/authentication_repository.dart';
import 'package:food_store/features/personalization/screens/profile/profile.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// title
                  CustomAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),

                  /// User profile card
                  AppUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),

                  /// Spacing to get a gap at the bottom of header
                  const SizedBox(height: AppSizes.spaceBtwSections + 15),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// --- account settings heading
                  const SectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  /// --- account settings body
                  const SettingsTile(
                    icon: Iconsax.safe_home,
                    title: "My address",
                    subTitle: "Set home address",
                  ),
                  const SettingsTile(
                    icon: Iconsax.shopping_cart,
                    title: "My cart",
                    subTitle: "Add, remove items and move to checkout",
                  ),
                  const SettingsTile(
                    icon: Iconsax.bag_tick,
                    title: "My orders",
                    subTitle: "In-progress and completed orders",
                  ),
                  const SettingsTile(
                    icon: Iconsax.wallet,
                    title: "My Wallet",
                    subTitle: "Wallet balance and recharge",
                  ),

                  /// --- app settings heading
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const SectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const SettingsTile(
                    icon: Iconsax.document_upload,
                    title: "Load data",
                    subTitle: "Upload Data to your cloud firestore",
                  ),

                  /// Logout
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text("Logout"),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
