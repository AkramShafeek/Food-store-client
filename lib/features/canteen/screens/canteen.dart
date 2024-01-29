import 'package:flutter/material.dart';
import 'package:food_store/common/product/item_cards/canteen_card.dart';
import 'package:food_store/common/product/item_cards/food_item_card.dart';
import 'package:food_store/features/canteen/screens/widgets/canteen_screen_header.dart';
import 'package:food_store/features/canteen/controllers/canteen_controller.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class Canteens {
  static const List<Map<String, String>> canteens = [
    {"name": "Vidyarthi Khana", "image": AppImages.vegFriedMaggi},
    {"name": "Gowda Canteen", "image": AppImages.vegFriedMaggi2},
    {"name": "Nescafe", "image": AppImages.nescafeCanteen},
    {"name": "Kapi Kuteera", "image": AppImages.vegFriedMaggi},
    {"name": "Vidyarti Khana Law block", "image": AppImages.vegFriedMaggi},
  ];
}

class CanteenScreen extends StatelessWidget {
  CanteenScreen({super.key});

  final controller = Get.put(CanteenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: controller.showCanteenMenu.value
            ? const CanteenMenuPage()
            : const CanteenPage(),
      ),
    );
  }
}

class CanteenPage extends StatelessWidget {
  const CanteenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CanteenScreenHeader(),
        Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            children: Canteens.canteens
                .map<Widget>(
                  (canteen) => CanteenCard(
                      canteenName: canteen["name"]!, image: canteen["image"]!),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class CanteenMenuPage extends StatelessWidget {
  const CanteenMenuPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CanteenController.instance;
    return Column(
      children: [
        CanteenScreenHeader(),
        Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Obx(
            () => Column(
              children: controller.items
                  .map((e) => FoodItemCard(
                        foodName: e.name,
                        canteenName: e.canteen,
                        price: e.price,
                        image: e.image,
                        isNetworkImage: true,
                        id: e.id,
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
