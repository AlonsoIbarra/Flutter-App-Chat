import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:flutter_chat/src/config/utils/app_image_routes.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../update_profile_controller.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({
    Key? key,
    required this.updateProfileController,
  }) : super(key: key);
  UpdateProfileController updateProfileController;
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: editFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
            child: Obx(
              () => GestureDetector(
                onTap: () => updateProfileController.updateProfileImage(),
                child:
                    ((updateProfileController.user.value.image ?? '').isEmpty)
                        ? Image.asset(AppImageRoutes.imageProfileDefault)
                        : Image.network(
                            updateProfileController.user.value.image!,
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
              onChanged: (value) => updateProfileController.hasChanges = true,
              validator: (value) {
                if (GetUtils.isNullOrBlank(value) ?? false) {
                  return 'Ingrese nombre';
                }
                return null;
              },
              controller: updateProfileController.nameController,
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
              onChanged: (value) => updateProfileController.hasChanges = true,
              validator: (value) {
                if (GetUtils.isNullOrBlank(value) ?? false) {
                  return 'Ingrese teléfono';
                }
                return null;
              },
              controller: updateProfileController.phoneController,
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
              onChanged: (value) => updateProfileController.hasChanges = true,
              validator: (value) {
                if (GetUtils.isNullOrBlank(value) ?? false) {
                  return 'Ingrese correo electrónico';
                }
                if (!GetUtils.isEmail(value ?? '')) {
                  return 'Ingrese correo electrónico valido';
                }
                return null;
              },
              controller: updateProfileController.emailController,
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
                if (editFormKey.currentState?.validate() ?? false) {
                  updateProfileController.updateUser();
                }
              },
              child: Text(
                'Guardar',
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
