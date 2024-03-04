import 'package:flutter/material.dart';
import 'package:food_store/common/product/item_cards/food_item_card.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/features/cart/controllers/cart_controller.dart';
import 'package:food_store/features/cart/models/cart_item_model.dart';
import 'package:food_store/features/cart/screens/widgets/cart_screen_header.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Scaffold(
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
    final controller = Get.put(CartController());
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
              Obx(() => Text("Total: ${controller.canteenTotal[canteen]}")),
              TextButton(
                onPressed: () =>
                    controller.checkoutFromCanteen(canteen: canteen),
                child: const Text("Checkout"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
