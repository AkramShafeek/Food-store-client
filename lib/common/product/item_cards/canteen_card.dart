import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class CanteenCard extends StatelessWidget {
  const CanteenCard({
    super.key,
    required this.canteenName,
    required this.image,
  });

  final String canteenName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const RoundedContainer(
              radius: 10,
              width: 100,
              height: 100,
              child: Center(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(AppImages.vegFriedMaggi),
                ),
              ),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              canteenName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right))
          ],
        ),
      ),
    );
  }
}
