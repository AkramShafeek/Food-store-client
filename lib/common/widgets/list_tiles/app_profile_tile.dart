import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/images/rounded_image.dart';
import 'package:food_store/features/personalization/controllers/user_controller.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppUserProfileTile extends StatelessWidget {
  const AppUserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Obx(
      () => ListTile(
        leading: const RoundedImage(
          imageUrl: AppImages.user,
          width: 50,
          height: 50,
          borderRadius: 50,
          padding: EdgeInsets.zero,
        ),
        title: Text(
          controller.user.value.fullname,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AppColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AppColors.white),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
