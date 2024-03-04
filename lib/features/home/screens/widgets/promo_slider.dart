import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_store/common/product/item_cards/popular_item_card.dart';
import 'package:food_store/features/home/screens/widgets/promo_slider_indicator.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.slides,
  });

  final List<Map<String, String>> slides;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PromoSliderController());

    return Column(
      children: [
        CarouselSlider(
          carouselController: controller.carouselController,
          options: CarouselOptions(
            height: 260,
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updateSlider(index),
          ),
          items: slides
              .map((item) => PopularItemCard(
                    image: item["image"]!,
                    name: item["name"]!,
                    canteen: item["canteen"]!,
                  ))
              .toList(),
        ),
        const SizedBox(height: AppSizes.md),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < slides.length; i++)
                SlideIndicator(
                    active: controller.carouselIndex.value, index: i),
            ],
          ),
        )
      ],
    );
  }
}

class PromoSliderController extends GetxController {
  static PromoSliderController get instance => Get.find();

  final RxInt carouselIndex = 0.obs;
  final carouselController = CarouselController();

  void updateSlider(index) => carouselIndex.value = index;
  void jumpToSlide(index) {
    carouselIndex.value = index;
    carouselController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
