import 'package:food_store/features/cart/models/cart_item_model.dart';
import 'package:food_store/features/checkout/controllers/checkout_controller.dart';
import 'package:food_store/features/checkout/screens/checkout.dart';
import 'package:food_store/features/orders/models/order_item_model.dart';
import 'package:food_store/features/orders/models/order_model.dart';
import 'package:food_store/utils/pop_ups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxMap<String, int> canteenTotal = RxMap<String, int>();
  RxMap<String, List<CartItemModel>> cart =
      RxMap<String, List<CartItemModel>>();
  RxInt numberOfItems = 0.obs;

  void addToCart(CartItemModel cartItem, int count) {
    String canteen = cartItem.item.canteen;

    if (!cart.containsKey(canteen)) {
      cart[canteen] = [cartItem];
      calculateTotals(canteen);
      calculateNumberOfItemsInCart();
      return;
    }

    for (int i = 0; i < cart[canteen]!.length; i++) {
      // if the same cartItem exists in the cart just update it's count
      if (cart[canteen]![i].item.id == cartItem.item.id) {
        cart[canteen]![i].count = count;
        calculateTotals(canteen);
        calculateNumberOfItemsInCart();
        return;
      }
    }

    // if the item doesn't exist in the cart then insert it
    cart[canteen]!.add(cartItem);
    calculateTotals(canteen);
    calculateNumberOfItemsInCart();
  }

  void removeFromCart(String canteen, String id) {
    // remove the item matching the id in the given canteen
    if (cart.containsKey(canteen)) {
      // create a copy of the list
      List<CartItemModel> temp = cart[canteen]!.map((e) => e).toList();
      // remove the respective item from the list
      temp.removeWhere((item) => item.item.id == id);

      // re initialize the new list to make a state change
      cart[canteen] = temp;
      if (cart[canteen]!.isEmpty) {
        canteenTotal.remove(canteen);
        cart.remove(canteen);
      }

      AppLoaders.warningSnackBar(
          title: "Removed", message: "Item removed completely from cart");

      calculateTotals(canteen);
      calculateNumberOfItemsInCart();
    }
  }

  void checkoutFromCanteen({required String canteen}) async {
    // create a list of order items from cart items
    List<OrderItemModel> orders;
    orders = cart[canteen]!
        .map((e) => OrderItemModel(id: '', count: e.count, item: e.item))
        .toList();

    int totalPrice = 0;
    for (var item in cart[canteen]!) {
      totalPrice += item.count * item.item.price;
    }

    // create an order model
    OrderModel order = OrderModel(
      id: '',
      merchantId: canteen,
      canteen: canteen,
      totalPrice: totalPrice,
      orders: orders,
      status: 0,
    );

    final checkoutController = Get.put(CheckoutController());
    checkoutController.setOrder(order);

    // final orderRepository = Get.put(OrderRepository());
    // await orderRepository.saveOrder(order);
    // cart.remove(canteen);

    Get.to(() => const CheckoutScreen());
  }

  void calculateTotals(String canteen) {
    for (var canteen in cart.keys) {
      int totalPrice = 0;
      for (var item in cart[canteen]!) {
        totalPrice += item.count * item.item.price;
      }
      canteenTotal[canteen] = totalPrice;
    }
  }

  void removeCanteen({required String canteen}) {
    cart.remove(canteen);
    calculateNumberOfItemsInCart();
  }

  void calculateNumberOfItemsInCart() {
    numberOfItems.value = 0;
    cart.forEach((key, value) {
      for (var element in value) {
        numberOfItems.value += element.count;
      }
    });
  }
}
