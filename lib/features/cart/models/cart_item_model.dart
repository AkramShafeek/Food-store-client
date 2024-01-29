import 'package:food_store/features/canteen/models/menu_item_model.dart';

class CartItemModel {
  CartItemModel({this.count = 0, required this.item});

  int count;
  MenuItemModel item;

  // function to create empty cart item model
  static CartItemModel empty() => CartItemModel(
        item: MenuItemModel.empty(),
        count: 0,
      );

  // function to create empty cart item model list
  static List<CartItemModel> emptyList() => [];

  // function to convert CartItemModel data into json
  Map<String, dynamic> toJson() {
    return {
      "item": item,
      "count": count,
    };
  }
}
