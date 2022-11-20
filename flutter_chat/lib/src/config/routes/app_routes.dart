import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/routes/routes.dart';
import 'package:flutter_chat/src/ui/login/login_page.dart';

Map<String, WidgetBuilder> get appRoutes {
  return {
    Routes.login: (_) => LoginPage(),
  };
}
