import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'profile_controller.dart';
import 'widgets/circle_image_user.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({Key? key, ProfileController? profileController})
      : profileController = profileController ?? ProfileController();
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => profileController.signOut(),
        backgroundColor: AppColors.secondaryButtonBackgroundColor,
        child: const Icon(Icons.power_settings_new),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Center(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                    child: GestureDetector(
                      onTap: () => profileController.updateProfileImage(),
                      child: CircleImageUser(
                        profileUserImage:
                            profileController.user.value.image ?? '',
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Nombre del usuario'),
                    subtitle: Text(profileController.user.value.name),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Email'),
                    subtitle: Text(profileController.user.value.email),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Telefono'),
                    subtitle: Text(profileController.user.value.phone),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
