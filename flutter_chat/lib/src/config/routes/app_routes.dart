import 'package:flutter_chat/src/config/routes/routes.dart';
import 'package:flutter_chat/src/ui/login/login_page.dart';
import 'package:flutter_chat/src/ui/register/register_page.dart';
import 'package:get/get.dart';

List<GetPage> get appPages {
  return [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
    ),
  ];
}
