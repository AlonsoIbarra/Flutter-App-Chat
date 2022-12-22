import 'package:flutter/material.dart';
import 'package:flutter_chat/src/ui/home/widgets/app_navigation_bar.dart';
import 'package:flutter_chat/src/ui/home/widgets/tabs/chats/chats_tab.dart';
import 'package:flutter_chat/src/ui/home/widgets/tabs/profile/view/profile_tab.dart';
import 'package:flutter_chat/src/ui/home/widgets/tabs/users/users_tab.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
    HomeController? homeController,
  })  : homeController = homeController ?? HomeController(),
        super(key: key);
  HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: homeController.tabIndex.value,
          children: [
            const ChatsTab(),
            UsersTab(),
            ProfileTab(),
          ],
        ),
      ),
      bottomNavigationBar: AppNavigationBar(homeController: homeController),
    );
  }
}
