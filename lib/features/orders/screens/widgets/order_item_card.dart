import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/images/rounded_image.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/constants/sizes.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xs),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const RoundedImage(
              imageUrl: AppImages.vegFriedMaggi,
              borderRadius: 10,
              width: 90,
              height: 90,
              isNetworkImage: false,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Veg fried Maggi",
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.xs),
                    // if (canteenName != null)
                    //   Text(
                    //     canteenName ?? "",
                    //     style: Theme.of(context).textTheme.labelSmall,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    const SizedBox(height: AppSizes.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rs. ${50.toString()}',
                            style: Theme.of(context).textTheme.bodySmall),
                        const Text('x2')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
