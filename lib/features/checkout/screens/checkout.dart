import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/app%20bar/app_bar.dart';
import 'package:food_store/features/checkout/controllers/checkout_controller.dart';
import 'package:food_store/features/payment/screens/payment.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        height: 100,
        child: Container(
          // color: isDark ? AppColors.dark : AppColors.light,
          padding: const EdgeInsets.all(AppSizes.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: AppSizes.spaceBtwItems + 5),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const PaymentScreen());
                  },
                  child: const Text("Proceed to pay"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.md,
            left: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace,
            bottom: AppSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Summary",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSizes.md),
              const Divider(height: 20),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Text(
                "Canteen: ",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                controller.order.value.canteen,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Text(
                "Items: ",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSizes.sm),

              /// Rendering the list of ordered items for summary
              for (var order in controller.order.value.orders)
                ItemWidget(
                    name: order.item.name,
                    price: order.item.price,
                    count: order.count),

              const SizedBox(height: AppSizes.md),
              const Divider(height: 20),
              const SizedBox(height: AppSizes.md),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Total ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  controller.order.value.totalPrice.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.name,
    required this.price,
    required this.count,
  });

  final String name;
  final int price;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '$price x$count',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm)
      ],
    );
  }
}
