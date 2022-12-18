import 'package:flutter/material.dart';
import 'package:flutter_chat/src/data/services/local/get_storage_service.dart';
import 'package:flutter_chat/src/data/services/local/multimedia_service.dart';
import 'package:flutter_chat/src/domain/abstract_repositories/abstract_user_repository.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  final MultimediaService multimediaService;
  Rx<User> user = GetStorageService.maybeGetLoggedUser().obs;

  UpdateProfileController(
    this.userRepository, {
    MultimediaService? multimediaService,
  }) : multimediaService = multimediaService ?? MultimediaService() {
    nameController.text = user.value.name;
    phoneController.text = user.value.phone;
    emailController.text = user.value.email;
  }
  final AbstractUserRepository userRepository;
  bool hasChanges = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void updateProfileImage() async {
    final file = await multimediaService.selectImageFromLocalGallery();
    if (file != null) {
      final result = await userRepository.updateProfileImage(
        user.value,
        file.path,
      );
      result.when(
        (requestError) => requestError.when(
          network: () => Get.snackbar('Error', 'Network'),
          notFound: () => Get.snackbar('Error', 'notFound'),
          serverError: () => Get.snackbar('Error', 'Server error'),
          unhandled: () => Get.snackbar('Error', 'Unhandled'),
          customError: (_) => Get.snackbar('Error', 'Custom error'),
        ),
        (userUpdated) {
          GetStorageService.saveGetLoggedUser(userUpdated);
          user.value = userUpdated;
          Get.snackbar('Success', 'Picture updated!');
        },
      );
    }
  }

  void updateUser() async {
    if (!hasChanges) {
      Get.snackbar('Ups!', 'Nothing to update so far.');
      return;
    }
    final newUser = user.value.copyWith(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
    );

    final result = await userRepository.updateUser(newUser);
    result.when(
      (httpError) => httpError.when(
        network: () => Get.snackbar('Error', 'Network'),
        notFound: () => Get.snackbar('Error', 'notFound'),
        serverError: () => Get.snackbar('Error', 'Server error'),
        unhandled: () => Get.snackbar('Error', 'Unhandled'),
        customError: (_) => Get.snackbar('Error', 'Custom error'),
      ),
      (userUpdated) {
        GetStorageService.saveGetLoggedUser(userUpdated);
        user.value = userUpdated;
        Get.snackbar('Success', 'User updated!');
        hasChanges = false;
      },
    );
  }
}
