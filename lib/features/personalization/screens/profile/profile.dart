import 'package:flutter/material.dart';
import 'package:food_store/common/texts/section_heading.dart';
import 'package:food_store/common/widgets/app%20bar/app_bar.dart';
import 'package:food_store/common/widgets/images/rounded_image.dart';
import 'package:food_store/features/personalization/controllers/user_controller.dart';
import 'package:food_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:food_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),

      /// -- body
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                /// Profile picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const RoundedImage(
                        imageUrl: AppImages.user,
                        width: 80,
                        height: 80,
                        borderRadius: 80,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Picture"),
                      ),

                      /// Details
                      const SizedBox(height: AppSizes.spaceBtwItems / 2),
                      const Divider(),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      /// Proifle info heading
                      const SectionHeading(
                          title: "Profile Information",
                          showActionButton: false),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      /// Profile information
                      ProfileMenu(
                        title: "Name",
                        value: controller.user.value.fullname,
                        onPressed: () => Get.to(() => const ChangeName()),
                      ),
                      ProfileMenu(
                        title: "Username",
                        value: controller.user.value.username,
                        onPressed: () {},
                      ),

                      const SizedBox(height: AppSizes.spaceBtwItems / 2),
                      const Divider(),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      /// Personal info heading
                      const SectionHeading(
                          title: "Personal Information",
                          showActionButton: false),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      /// Personal information
                      ProfileMenu(
                        title: "Email",
                        value: controller.user.value.email,
                        onPressed: () {},
                      ),
                      ProfileMenu(
                        title: "Phone",
                        value: controller.user.value.phonenumber,
                        onPressed: () {},
                      ),
                      const Divider(),
                      const SizedBox(height: AppSizes.spaceBtwItems),

                      /// Close account
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Close Account",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
