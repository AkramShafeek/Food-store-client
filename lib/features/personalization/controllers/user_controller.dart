import 'package:food_store/data/repositories/user/user_repository.dart';
import 'package:food_store/features/personalization/models/user_model.dart';
import 'package:food_store/utils/pop_ups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  final isUploadInProgress = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user record from any registration provider

  /// Upload profile image
  uploadUserProfilePicture() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (image != null) {
      try {
        // set loading status
        isUploadInProgress.value = true;

        // upload image
        final imageUrl =
            await userRepository.uploadImage("users/images/profile/", image);

        // update user image record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        AppLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your profile image has been updated!",
        );
      } catch (e) {
        AppLoaders.errorSnackBar(
            title: "Oh Snap!", message: "Something went wrong: $e");
      } finally {
        isUploadInProgress.value = false;
      }
    }
  }
}
