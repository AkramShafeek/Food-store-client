import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:food_store/features/cart/cart%20item%20card/cart_item_card.dart';
import 'package:food_store/features/cart/screens/widgets/cart_screen_header.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/helper/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Container(
        color: isDark ? AppColors.dark : AppColors.light,
        padding: const EdgeInsets.all(AppSizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: AppSizes.md),
                child: Text(
                  "Total: 120",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const CartScreenHeader(),

            /// Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Accordion(
                maxOpenSections: 2,
                disableScrolling: true,
                children: [
                  AccordionBuilder.build(
                    header: const CartAccordionHeader(title: "Vidyarti Khana"),
                    content: const CartAccordionBody(),
                    isDark: isDark,
                  ),
                  AccordionBuilder.build(
                    header: const CartAccordionHeader(title: "Nescafe"),
                    content: const CartAccordionBody(),
                    isDark: isDark,
                  ),
                  AccordionBuilder.build(
                    header: const CartAccordionHeader(title: "Gowda Canteen"),
                    content: const CartAccordionBody(),
                    isDark: isDark,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccordionBuilder {
  static AccordionSection build(
      {required Widget header, required Widget content, required bool isDark}) {
    return AccordionSection(
      headerBackgroundColor: isDark ? AppColors.dark : AppColors.light,
      contentBorderColor: Colors.transparent,
      contentBackgroundColor: isDark ? AppColors.dark : AppColors.light,
      contentBorderRadius: 10,
      headerBorderWidth: 0,
      rightIcon: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(
          Iconsax.arrow_down_1,
          size: 20,
        ),
      ),
      header: header,
      content: content,
    );
  }
}

class CartAccordionHeader extends StatelessWidget {
  const CartAccordionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.lg),
      child: Text(title),
    );
  }
}

class CartAccordionBody extends StatelessWidget {
  const CartAccordionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartItemCard(),
        const SizedBox(height: AppSizes.spaceBtwItems),
        const CartItemCard(),
        const SizedBox(height: AppSizes.spaceBtwItems),
        TextButton(
          onPressed: () {},
          child: const Text("Checkout from canteen"),
        ),
      ],
    );
  }
}
