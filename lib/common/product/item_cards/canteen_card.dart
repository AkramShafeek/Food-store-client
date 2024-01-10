import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/features/canteen/controllers/canteen_controller.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class CanteenCard extends StatelessWidget {
  CanteenCard({
    super.key,
    required this.canteenName,
    required this.image,
  });

  final String canteenName;
  final String image;
  final CanteenController controller = CanteenController.instance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xs),
        child: Row(
          children: [
            RoundedContainer(
              radius: 10,
              width: 100,
              height: 100,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
            const SizedBox(width: AppSizes.md + 5),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(
                      canteenName,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.setCanteenName(canteenName);
                      controller.openCanteenMenu();
                    },
                    icon: const Icon(Iconsax.arrow_right),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
