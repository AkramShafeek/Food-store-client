import 'package:flutter/material.dart';
import 'package:food_store/common/product/item_cards/food_item_card.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/constants/sizes.dart';

class PreviouslyOrderedItems {
  static const List<Map<String, dynamic>> items = [
    {
      "name": "Veg fried maggi",
      "canteen": "Vidyarti Khana",
      "image": AppImages.vegFriedMaggi,
      "price": 50
    },
    {
      "name": "Veg fried maggi",
      "canteen": "Gowda Canteen",
      "image": AppImages.vegFriedMaggi2,
      "price": 45
    },
    {
      "name": "Veg fried maggi cheese",
      "canteen": "Vidyarti Khana",
      "image": AppImages.vegFriedMaggi,
      "price": 50
    },
  ];
}

class PreviouslyOrderedItemsList extends StatelessWidget {
  const PreviouslyOrderedItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: PreviouslyOrderedItems.items.map<Widget>(
        (item) {
          return Column(
            children: [
              FoodItemCard(
                foodName: item["name"]!,
                canteenName: item["canteen"]!,
                price: item["price"]!,
                image: item["image"]!,
              ),
              const SizedBox(height: AppSizes.sm)
            ],
          );
        },
      ).toList(),
    );
  }
}
