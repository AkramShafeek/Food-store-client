import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_store/features/canteen/models/menu_item_model.dart';

class OrderItemModel {
  OrderItemModel({
    required this.id,
    required this.count,
    required this.item,
  });

  final String id;
  final int count;
  MenuItemModel item;

  // function to create empty user model
  static OrderItemModel empty() => OrderItemModel(
        id: '',
        item: MenuItemModel.empty(),
        count: 0,
      );

  // function to create empty user model
  static List<OrderItemModel> emptyList() => [];

  // function to convert OrderItemModel data into json
  Map<String, dynamic> toJson() {
    return {
      "item": item,
      "count": count,
    };
  }

  /// Factory method to create a OrderItemModel from a firebase document snapshot
  factory OrderItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return OrderItemModel(
        id: document.id,
        count: data?["count"] ?? 0,
        item: data?["item"] ?? MenuItemModel.empty(),
      );
    } else {
      return OrderItemModel.empty();
    }
  }
}
