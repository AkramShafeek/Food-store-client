import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItemModel {
  MenuItemModel({
    required this.id,
    required this.name,
    required this.canteen,
    required this.price,
    required this.image,
  });

  final String id;
  final int price;
  final String image;
  String name;
  String canteen;

  // function to create empty user model
  static MenuItemModel empty() => MenuItemModel(
        id: '',
        name: '',
        canteen: '',
        price: 0,
        image: '',
      );

  // function to create empty user model
  static List<MenuItemModel> emptyList() => [];

  // function to convert MenuItemModel data into json
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "canteen": canteen,
      "image": image,
      "price": price,
    };
  }

  /// Factory method to create a MenuItemModel from a firebase document snapshot
  factory MenuItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return MenuItemModel(
        id: document.id,
        name: data?["name"] ?? '',
        canteen: data?["canteen"] ?? '',
        price: data?["price"] ?? 0,
        image: data?["image"] ?? '',
      );
    } else {
      return MenuItemModel.empty();
    }
  }
}
