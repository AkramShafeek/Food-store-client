import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/app%20bar/app_bar.dart';
import 'package:food_store/features/personalization/controllers/update_name_controller.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Change name",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              "Use real name for easy verification. This name will appear on several pages",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// Text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        AppValidator.validateEmptyText("First name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: "First name",
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        AppValidator.validateEmptyText("Last name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: "Last name",
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
