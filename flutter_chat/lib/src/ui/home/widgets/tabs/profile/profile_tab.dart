import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleImageUser(
                  imageProfilePath:
                      'https://anthoncode.com/wp-content/uploads/2020/01/logo-batman-old.png',
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Nombre del usuario'),
                  subtitle: Text(profileController.user.name),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                  subtitle: Text(profileController.user.email),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Telefono'),
                  subtitle: Text(profileController.user.phone),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
