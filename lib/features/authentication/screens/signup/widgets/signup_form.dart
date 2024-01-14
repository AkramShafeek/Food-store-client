import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SingupForm extends StatelessWidget {
  const SingupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>
                      AppValidator.validateEmptyText("First name", value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: "Firstname",
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      AppValidator.validateEmptyText("Last name", value),
                  decoration: const InputDecoration(
                    labelText: "Lastname",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                AppValidator.validateEmptyText("Username", value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: "Username",
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: "E-mail",
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phonenumber,
            validator: (value) => AppValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: "Phone number",
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => AppValidator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
              ),
              obscureText: controller.hidePassword.value,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text("Create account"),
            ),
          ),
        ],
      ),
    );
  }
}
