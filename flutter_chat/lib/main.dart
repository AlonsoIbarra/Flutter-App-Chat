import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_chat/src/config/routes/app_routes.dart';
import 'package:flutter_chat/src/config/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final String? initialRoute;
  final List<GetPage>? pages;

  const MyApp({
    Key? key,
    this.initialRoute,
    this.pages,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: !kReleaseMode,
        title: 'Flutter chat app',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
        ),
        initialRoute: widget.initialRoute ?? Routes.login,
        getPages: widget.pages ?? appPages,
        navigatorKey: Get.key,
      );
    });
  }
}
