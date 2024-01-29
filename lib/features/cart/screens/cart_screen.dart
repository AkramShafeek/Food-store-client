import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:food_store/common/product/item_cards/food_item_card.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/features/cart/cart%20item%20card/cart_item_card.dart';
import 'package:food_store/features/cart/controllers/cart_controller.dart';
import 'package:food_store/features/cart/models/cart_item_model.dart';
import 'package:food_store/features/cart/screens/widgets/cart_screen_header.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/helper/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(CartController());

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        height: 100,
        child: Container(
          color: isDark ? AppColors.dark : AppColors.light,
          padding: const EdgeInsets.all(AppSizes.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSizes.sm),
                  child: Text(
                    "Total: 120",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems + 5),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Checkout All"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                /// Header
                const CartScreenHeader(),

                /// Body
                Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final entry in controller.cart.entries)
                          Cart(canteen: entry.key, items: entry.value),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({
    super.key,
    required this.canteen,
    required this.items,
  });

  final String canteen;
  final List<CartItemModel> items;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      radius: AppSizes.sm,
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwSections),
      backgroundColor: AppColors.dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            canteen,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Column(
            children: items.map((cartItem) {
              return Column(
                children: [
                  FoodItemCard(
                    foodName: cartItem.item.name,
                    price: cartItem.item.price,
                    image: cartItem.item.image,
                    isNetworkImage: true,
                    canteenName: cartItem.item.canteen,
                    id: cartItem.item.id,
                    count: cartItem.count,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total: 80"),
              TextButton(
                onPressed: () {},
                child: const Text("Checkout"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
