import 'package:flutter/material.dart';
import 'package:flutter_chat/src/domain/abstract_repositories/abstract_auth_repository.dart';
import 'package:get/get.dart';

import '../../config/routes/routes.dart';
import '../../data/services/local/get_storage_service.dart';

class LoginController extends GetxController {
  final AbstractAuthRepository _authRepository;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginController(this._authRepository);
  Future<void> login() async {
    final response = await _authRepository.login(
      emailController.text,
      passwordController.text,
    );
    response.when(
      (error) => error.whenOrNull(
        network: () =>
            Get.snackbar('Error', 'Fallo en la conexión de internet'),
        notFound: () => Get.snackbar('Error', 'Url no encontrada'),
        serverError: () => Get.snackbar('Error', 'Error en el servidor'),
        unhandled: () =>
            Get.snackbar('Error', 'Ha ocurrido un error desconocido.'),
      ),
      (user) {
        GetStorageService.saveGetLoggedUser(user);
        Get.toNamed(Routes.home);
      },
    );
  }
}
