import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:food_store/features/canteen/models/menu_item_model.dart';
import 'package:food_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:food_store/utils/exceptions/firebase_exceptions.dart';
import 'package:food_store/utils/exceptions/format_exceptions.dart';
import 'package:food_store/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class MenuItemRepository extends GetxController {
  static MenuItemRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to fetch menu items data from Firestore based on selected canteen
  Future<List<MenuItemModel>> fetchMenuItems(String canteen) async {
    try {
      final querySnapShot = await _db
          .collection("MenuItems")
          .where("canteen", isEqualTo: canteen)
          .get();

      List<MenuItemModel> items = [];
      for (var doc in querySnapShot.docs) {
        items.add(MenuItemModel.fromSnapshot(doc));
      }

      return items;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again later";
    }
  }
}
