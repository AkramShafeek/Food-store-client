import 'package:flutter/material.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/helper/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
                top: AppSizes.appBarHeight,
                left: AppSizes.defaultSpace,
                right: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ) *
              2,
          child: Column(
            children: [
              Image(
                width: AppHelperFunctions.screenWidth() * 0.6,
                image: AssetImage(image),
              ),
              const SizedBox(
                height: AppSizes.defaultSpace,
              ),

              // Title and subtitles
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.defaultSpace,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.defaultSpace,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text("Continue")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
