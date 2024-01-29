import 'package:flutter/material.dart';
import 'package:food_store/common/product/cart/cart_action_buttons.dart';
import 'package:food_store/common/widgets/images/rounded_image.dart';
import 'package:food_store/features/canteen/models/menu_item_model.dart';
import 'package:food_store/features/cart/controllers/cart_controller.dart';
import 'package:food_store/features/cart/models/cart_item_model.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.foodName,
    this.canteenName,
    required this.price,
    required this.image,
    this.imageSize,
    this.isNetworkImage = false,
    this.id = '',
    this.count = 0,
  });

  final String foodName;
  final String? canteenName;
  final double? imageSize;
  final int price;
  final String image;
  final bool isNetworkImage;
  final String id;
  final int count;

  void updateCount(int count) {
    CartItemModel item = CartItemModel(
      count: count,
      item: MenuItemModel(
        id: id,
        name: foodName,
        canteen: canteenName ?? '',
        price: price,
        image: image,
      ),
    );

    // get the controller instance
    final controller = Get.put(CartController());

    // if count is zero, then remove from cart
    if (count == 0) {
      controller.removeFromCart(canteenName ?? '', id);
    } else {
      controller.addToCart(item, count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xs),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedImage(
              imageUrl: image,
              borderRadius: 10,
              width: imageSize ?? 120,
              height: imageSize ?? 120,
              isNetworkImage: isNetworkImage,
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
                      foodName,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.xs),
                    if (canteenName != null)
                      Text(
                        canteenName ?? "",
                        style: Theme.of(context).textTheme.labelSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: AppSizes.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rs. ${price.toString()}',
                            style: Theme.of(context).textTheme.bodySmall),
                        CartActionButtons(
                            updateCount: updateCount, initCount: count),
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
