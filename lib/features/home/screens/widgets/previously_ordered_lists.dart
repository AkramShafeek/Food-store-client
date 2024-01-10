import 'package:flutter/material.dart';
import 'package:food_store/common/product/item_cards/previously_ordered_card.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/constants/sizes.dart';

class PreviouslyOrderedItems {
  static const List<Map<String, dynamic>> items = [
    {
      "name": "Veg fried maggi",
      "canteen": "Vidyarti Khana",
      "image": AppImages.vegFriedMaggi,
      "price": 50.0
    },
    {
      "name": "Veg fried maggi",
      "canteen": "Gowda Canteen",
      "image": AppImages.vegFriedMaggi2,
      "price": 45.0
    },
    {
      "name": "Veg fried maggi cheese",
      "canteen": "Vidyarti Khana",
      "image": AppImages.vegFriedMaggi,
      "price": 50.0
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
              PreviouslyOrderedCard(
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
