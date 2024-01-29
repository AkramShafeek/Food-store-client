import 'package:food_store/data/models/menu_item_model.dart';
import 'package:food_store/data/repositories/menu%20item/menu_item_repository.dart';
import 'package:get/get.dart';

class CanteenController extends GetxController {
  static CanteenController get instance => Get.find();

  final Rx<String> canteen = "".obs;
  final Rx<bool> showCanteenMenu = false.obs;
  final RxList<MenuItemModel> items = RxList<MenuItemModel>();

  @override
  void onInit() {
    Get.put(MenuItemRepository());
    super.onInit();
  }

  void setCanteenName(String name) => canteen.value = name;

  void openCanteenMenu() async {
    List<MenuItemModel> fetchedItems =
        await MenuItemRepository.instance.fetchMenuItems(canteen.value);
    items.assignAll(fetchedItems.obs); // Convert to RxList
    showCanteenMenu.value = true;
  }

  void closeCanteenMenu() => showCanteenMenu.value = false;
}
