import 'package:flutter/material.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/helper/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final bool isDarkMode = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.md)),
          child: Obx(
            () => NavigationBar(
              backgroundColor: isDarkMode ? AppColors.dark : AppColors.white,
              indicatorColor: isDarkMode
                  ? AppColors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1),
              selectedIndex: controller.index.value,
              onDestinationSelected: (index) => controller.index.value = index,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Iconsax.home),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.shop),
                  label: "Canteen",
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.shopping_cart),
                  label: "Cart",
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.user),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.index.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt index = 0.obs;

  final screens = [
    Container(
      // color: Colors.white,
      child: const Center(child: Text("home")),
    ),
    Container(
      // color: Colors.white,
      child: const Center(child: Text("shop")),
    ),
    Container(
      // color: Colors.white,
      child: const Center(child: Text("cart")),
    ),
    Container(
      // color: Colors.white,
      child: const Center(child: Text("profile")),
    ),
  ];
}
