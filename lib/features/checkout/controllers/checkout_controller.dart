import 'package:food_store/features/cart/controllers/cart_controller.dart';
import 'package:food_store/features/orders/models/order_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  Rx<OrderModel> order = OrderModel.empty().obs;

  void setOrder(OrderModel order) => this.order.value = order;

  void placeOrder() {
    final cartController = Get.put(CartController());
    cartController.removeCanteen(canteen: order.value.canteen);
  }
}
