import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_store/features/orders/models/order_item_model.dart';

class OrderModel {
  OrderModel({
    required this.id,
    required this.merchantId,
    required this.canteen,
    required this.totalPrice,
    required this.orders,
    required this.status,
  });

  final String id;
  final int totalPrice;
  final String merchantId;
  final String canteen;
  final List<OrderItemModel> orders;
  int status;

  // function to create empty user model
  static OrderModel empty() => OrderModel(
        id: '',
        merchantId: '',
        canteen: '',
        totalPrice: 0,
        orders: OrderItemModel.emptyList(),
        status: 0,
      );

  // function to create empty user model
  static List<OrderModel> emptyList() => [];

  // function to convert OrderModel data into json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "canteen": canteen,
      "totalPrice": totalPrice,
      "orders": orders,
      "status": status,
    };
  }

  /// Factory method to create a OrderModel from a firebase document snapshot
  factory OrderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return OrderModel(
        id: document.id,
        merchantId: data?["merchantId"] ?? '',
        canteen: data?["canteen"] ?? '',
        totalPrice: data?["totalPrice"] ?? 0,
        orders: data?["orders"] ?? OrderItemModel.emptyList(),
        status: data?["status"] ?? 0,
      );
    } else {
      return OrderModel.empty();
    }
  }
}
