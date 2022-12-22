import 'package:flutter_chat/src/config/routes/routes.dart';
import 'package:flutter_chat/src/ui/home/home_page.dart';
import 'package:flutter_chat/src/ui/home/widgets/tabs/profile/edit/edit_profile_page.dart';
import 'package:flutter_chat/src/ui/login/login_page.dart';
import 'package:flutter_chat/src/ui/messages/messages_page.dart';
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
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfilePage(),
    ),
    GetPage(
      name: Routes.messages,
      page: () => MessagesPage(),
    ),
  ];
}
