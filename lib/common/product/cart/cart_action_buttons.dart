import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartActionButtons extends StatelessWidget {
  const CartActionButtons({
    super.key,
    required this.updateCount,
    this.initCount = 0,
  });

  final Function updateCount;
  final int initCount;

  @override
  Widget build(BuildContext context) {
    final ItemController controller = ItemController();
    controller.count.value = initCount;
    return Row(children: [
      GestureDetector(
        onTap: () {
          controller.decrement();
          updateCount(controller.count.value);
        },
        child: RoundedContainer(
          border: Border.all(color: AppColors.grey),
          radius: 4,
          backgroundColor: Colors.transparent,
          child: const Icon(
            Iconsax.minus,
          ),
        ),
      ),
      Obx(
        () => RoundedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 25,
          radius: 4,
          backgroundColor: Colors.transparent,
          child: Center(
              child: Text(
            controller.count.value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      ),
      GestureDetector(
        onTap: () {
          controller.count.value += 1;
          updateCount(controller.count.value);
        },
        child: RoundedContainer(
          border: Border.all(color: AppColors.primary),
          radius: 4,
          backgroundColor: AppColors.primary,
          child: const Icon(
            color: Colors.white,
            Iconsax.add,
          ),
        ),
      ),
    ]);
  }
}

class ItemController extends GetxController {
  final RxInt count = 0.obs;

  void decrement() {
    if (count.value == 0) {
      return;
    } else {
      count.value -= 1;
    }
  }
}
