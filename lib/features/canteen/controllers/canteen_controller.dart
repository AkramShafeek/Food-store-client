import 'package:get/get.dart';

class CanteenController extends GetxController {
  static CanteenController get instance => Get.find();

  final Rx<String> canteen = "".obs;
  final Rx<bool> showCanteenMenu = false.obs;

  void setCanteenName(String name) => canteen.value = name;
  void openCanteenMenu() => showCanteenMenu.value = true;
  void closeCanteenMenu() => showCanteenMenu.value = false;
}
