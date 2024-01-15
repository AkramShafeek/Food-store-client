import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemData {
  CartItemData({
    this.child,
    this.isExpanded,
  });

  Widget? child;
  RxBool? isExpanded;
}

class CartItemController extends GetxController {
  final isExpanded = false.obs;
}
