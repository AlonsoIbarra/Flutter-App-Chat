import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:flutter_chat/src/ui/home/home_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';

class AppNavigationBar extends StatelessWidget {
  final HomeController homeController;
  const AppNavigationBar({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 15.h,
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: homeController.changeTab,
          currentIndex: homeController.tabIndex.value,
          backgroundColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.unselectedTab,
          selectedItemColor: AppColors.selectedTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 15.sp,
              ),
              label: 'Chats',
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 15.sp,
              ),
              label: 'Usuarios',
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin_rounded,
                size: 15.sp,
              ),
              label: 'Perfil',
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
