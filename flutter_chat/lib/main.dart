import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:flutter_chat/src/data/services/local/get_storage_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_chat/src/config/routes/app_routes.dart';
import 'package:flutter_chat/src/config/routes/routes.dart';

import 'src/repositories_injection.dart';

void main() async {
  repositoriesInjection(
    dio: Dio(
      BaseOptions(
        baseUrl: 'http://192.168.50.38:3000',
      ),
    ),
  );
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  String? initialRoute;
  final List<GetPage>? pages;

  MyApp({
    Key? key,
    this.initialRoute,
    this.pages,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final user = GetStorageService.maybeGetLoggedUser();
    if (user.id != null && widget.initialRoute == null) {
      widget.initialRoute = Routes.home;
    }
    super.initState();
  }

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
        builder: EasyLoading.init(),
      );
    });
  }
}
