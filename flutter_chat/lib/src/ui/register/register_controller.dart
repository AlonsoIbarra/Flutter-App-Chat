import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  void register() {
    print("email ${emailController.text}");
    print("password ${passwordController.text}");
  }
}
