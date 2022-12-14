import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/routes/routes.dart';
import 'package:flutter_chat/src/data/services/local/multimedia_service.dart';
import 'package:flutter_chat/src/domain/abstract_repositories/abstract_user_repository.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController(this.userRepository, this.multimediaService);
  final AbstractUserRepository userRepository;
  final MultimediaService multimediaService;
  var profileImagePath = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void register() async {
    EasyLoading.show();
    final user = User(
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
      password: passwordController.text,
      image: profileImagePath.value,
    );
    final result = await userRepository.createUser(user);
    EasyLoading.dismiss();
    result.whenIsRight((value) {
      Get.snackbar('Registro exitoso', 'Inicia sesión');
      Get.toNamed(Routes.login);
    });
    result.whenIsLeft(
      (error) => error.whenOrNull(
        network: () =>
            Get.snackbar('Error', 'Fallo en la conexión de internet'),
        notFound: () => Get.snackbar('Error', 'Url no encontrada'),
        serverError: () => Get.snackbar('Error', 'Error en el servidor'),
        unhandled: () =>
            Get.snackbar('Error', 'Ha ocurrido un error desconocido.'),
      ),
    );
  }

  void loadProfileImage() async {
    final File? file = await multimediaService.selectImageFromLocalGallery();
    if (file != null) {
      profileImagePath.value = file.path;
    }
  }
}
