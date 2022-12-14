import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:flutter_chat/src/ui/register/register_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../config/utils/app_image_routes.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    Key? key,
    required this.registerController,
  }) : super(key: key);
  RegisterController registerController;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
            child: Obx(
              () => GestureDetector(
                onTap: () => registerController.loadProfileImage(),
                child: (registerController.profileImagePath.value.isEmpty)
                    ? Image.asset(AppImageRoutes.imageProfileDefault)
                    : Image.file(
                        File(
                          registerController.profileImagePath.value,
                        ),
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
            child: TextFormField(
              validator: (value) {
                if (GetUtils.isNullOrBlank(value) ?? false) {
                  return 'Ingrese nombre';
                }
                return null;
              },
              controller: registerController.nameController,
              style: TextStyle(
                color: AppColors.textColor,
              ),
              decoration: InputDecoration(
                hintText: 'Nombre',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(5.w),
                prefixIcon: Icon(
                  Icons.person,
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
            child: TextFormField(
              validator: (value) {
                if (GetUtils.isNullOrBlank(value) ?? false) {
                  return 'Ingrese teléfono';
                }
                return null;
              },
              controller: registerController.phoneController,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                color: AppColors.textColor,
              ),
              decoration: InputDecoration(
                hintText: 'Teléfono',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(5.w),
                prefixIcon: Icon(
                  Icons.phone,
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
            child: TextFormField(
              validator: (value) {
                if (GetUtils.isNullOrBlank(value) ?? false) {
                  return 'Ingrese correo electrónico';
                }
                if (!GetUtils.isEmail(value ?? '')) {
                  return 'Ingrese correo electrónico valido';
                }
                return null;
              },
              controller: registerController.emailController,
              keyboardType: TextInputType.emailAddress,
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
            child: TextFormField(
              validator: (value) {
                if (GetUtils.isNullOrBlank(value) ?? false) {
                  return 'Ingrese contraseña';
                }
                return null;
              },
              controller: registerController.passwordController,
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
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryOpacityColor,
              borderRadius: BorderRadius.circular(5.w),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextFormField(
              validator: (value) {
                if (GetUtils.isNullOrBlank(
                        registerController.passwordController.text) ??
                    false) {
                  return null;
                }
                if (GetUtils.isNullOrBlank(value) ?? false) {
                  return 'Confirme su contraseña';
                }
                if (registerController.passwordController.text != value) {
                  return 'Las contraseñas no coinciden';
                }
                return null;
              },
              controller: registerController.passwordConfirmController,
              obscureText: true,
              style: TextStyle(
                color: AppColors.textColor,
              ),
              decoration: InputDecoration(
                hintText: 'Confirmar contraseña',
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
              onPressed: () async {
                if (registerController.profileImagePath.value.isEmpty) {
                  Get.snackbar('Ops!', 'Por favor agrege foto de perfil.');
                  return;
                }
                if (registerFormKey.currentState?.validate() ?? false) {
                  registerController.register();
                }
              },
              child: Text(
                'Registrarse',
                style: TextStyle(
                  color: AppColors.textColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
