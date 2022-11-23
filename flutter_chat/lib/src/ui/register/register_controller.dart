import 'package:flutter/material.dart';
import 'package:flutter_chat/src/domain/abstract_repositories/abstractuser_repository.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterController extends GetxController {
  RegisterController(this.userRepository);
  final AbstractUserRepository userRepository;
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void register() async {
    final user = User(
      user: userController.text,
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );
    final result = await userRepository.createUser(user);
    result.when(
      (error) => print("Error ${error.toString()}"),
      (success) => print("Success $success"),
    );
  }
}
