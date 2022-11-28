import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/routes/routes.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('home page'),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.login,
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
    );
  }
}
