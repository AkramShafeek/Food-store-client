import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:food_store/data/repositories/authentication/authentication_repository.dart';
import 'package:food_store/features/orders/models/order_model.dart';
import 'package:food_store/features/personalization/models/user_model.dart';
import 'package:food_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:food_store/utils/exceptions/firebase_exceptions.dart';
import 'package:food_store/utils/exceptions/format_exceptions.dart';
import 'package:food_store/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveOrder(OrderModel order) async {
    try {
      /*
        Order
          |-- totalPrice
          |-- canteen
          |-- merchantId
          |-- status
          |-- orders(list)
                |-- count
                |-- menuItem
                      |-- id                      
                      |-- price
                      |-- image
                      |-- name
                      |-- canteen
      */
      DocumentReference doc =
          await _db.collection("PendingOrders").add(order.toJson());
      String id = doc.id;
      await doc.update({"uid": id});
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

  /// Function to fetch user data from Firestore based on User ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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
