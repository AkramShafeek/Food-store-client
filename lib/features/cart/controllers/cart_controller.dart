import 'package:food_store/features/cart/models/cart_item_model.dart';
import 'package:food_store/utils/pop_ups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxMap<String, List<CartItemModel>> cart =
      RxMap<String, List<CartItemModel>>();

  void addToCart(CartItemModel cartItem, int count) {
    String canteen = cartItem.item.canteen;

    if (!cart.containsKey(canteen)) {
      cart[canteen] = [cartItem];
      return;
    }

    for (int i = 0; i < cart[canteen]!.length; i++) {
      // if the same cartItem exists in the cart just update it's count
      if (cart[canteen]![i].item.id == cartItem.item.id) {
        cart[canteen]![i].count = count;
        return;
      }
    }

    // if the item doesn't exist in the cart then insert it
    cart[canteen]!.add(cartItem);
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
      if (cart[canteen]!.isEmpty) cart.remove(canteen);

      AppLoaders.warningSnackBar(
          title: "Removed", message: "Item removed completely from cart");
    }
  }
}
