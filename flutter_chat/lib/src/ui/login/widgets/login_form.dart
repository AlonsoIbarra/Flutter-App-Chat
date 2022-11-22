import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/routes/routes.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
    required this.loginController,
  }) : super(key: key);
  LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryOpacityColor,
            borderRadius: BorderRadius.circular(5.w),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextField(
            controller: loginController.emailController,
            style: TextStyle(
              color: AppColors.textColor,
            ),
            decoration: InputDecoration(
              hintText: 'Correo electrónico',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(5.w),
              prefixIcon: Icon(
                Icons.email,
                color: AppColors.primaryColor,
              ),
              hintStyle: TextStyle(
                color: AppColors.primaryColorDark,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryOpacityColor,
            borderRadius: BorderRadius.circular(5.w),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextField(
            controller: loginController.passwordController,
            obscureText: true,
            style: TextStyle(
              color: AppColors.textColor,
            ),
            decoration: InputDecoration(
              hintText: 'Contraseña',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(5.w),
              prefixIcon: Icon(
                Icons.lock,
                color: AppColors.primaryColor,
              ),
              hintStyle: TextStyle(
                color: AppColors.primaryColorDark,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          width: 70.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  5.w,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 3.w,
              ),
            ),
            onPressed: () => loginController.login(),
            child: Text(
              'Continuar',
              style: TextStyle(
                color: AppColors.textColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No tienes cuenta?'),
            SizedBox(
              width: 1.w,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.register,
                );
              },
              child: const Text(
                'Registrate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
