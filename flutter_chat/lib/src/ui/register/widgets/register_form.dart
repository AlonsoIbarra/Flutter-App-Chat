import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:flutter_chat/src/ui/register/register_controller.dart';
import 'package:sizer/sizer.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    Key? key,
    required this.registerController,
  }) : super(key: key);
  RegisterController registerController;

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
          child: TextField(
            controller: registerController.userController,
            style: TextStyle(
              color: AppColors.textColor,
            ),
            decoration: InputDecoration(
              hintText: 'Usuario',
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
          child: TextField(
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
          child: TextField(
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
          child: TextField(
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
          child: TextField(
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
            onPressed: () => registerController.register(),
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
    );
  }
}
