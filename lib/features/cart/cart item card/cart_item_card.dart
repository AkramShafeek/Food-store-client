import 'package:flutter/material.dart';
import 'package:food_store/common/product/item_cards/food_item_card.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/constants/sizes.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoundedContainer(
      width: double.infinity,
      radius: AppSizes.md,
      child: FoodItemCard(
        foodName: "Veg Fried Maggi",
        price: 40,
        image: AppImages.vegFriedMaggi,
      ),
    );
  }
}
