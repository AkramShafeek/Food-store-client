import 'package:flutter/material.dart';
import 'package:food_store/common/product/cart/cart_action_buttons.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/utils/constants/sizes.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.foodName,
    this.canteenName = "",
    required this.price,
    required this.image,
  });

  final String foodName;
  final String? canteenName;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xs),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedContainer(
              radius: 10,
              width: 120,
              height: 120,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodName,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      canteenName!,
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rs. ${price.toString()}',
                            style: Theme.of(context).textTheme.bodySmall),
                        const CartActionButtons(),
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
