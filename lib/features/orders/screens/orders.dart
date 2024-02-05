import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/features/orders/screens/widgets/order_item_card.dart';
import 'package:food_store/features/orders/screens/widgets/orders_screen_header.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                /// Header
                OrderScreenHeader(),

                /// Body
                Padding(
                  padding: EdgeInsets.all(AppSizes.defaultSpace),
                  child: Column(
                    children: [
                      Order(),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      Order(),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      Order(),
                      SizedBox(height: AppSizes.spaceBtwItems),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Order extends StatelessWidget {
  const Order({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.dark,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// order id header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order id: 124SDdnb12",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: AppSizes.sm),
                Text(
                  "Vidyarthi Khana",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// order items
            const Column(
              children: [
                OrderItemCard(),
                SizedBox(height: 5),
                OrderItemCard(),
                SizedBox(height: 5),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            const Divider(
              height: 5,
              thickness: 3,
            ),
            const SizedBox(height: AppSizes.md),

            /// summary and status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total items",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "2",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "120",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: AppSizes.md),
                const RoundedContainer(
                  height: 8,
                  width: 100 * 2,
                  backgroundColor: Colors.greenAccent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
