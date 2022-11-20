import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_chat/src/config/routes/app_routes.dart';
import 'package:flutter_chat/src/config/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final String? initialRoute;
  final Map<String, Widget Function(BuildContext)>? routes;

  MyApp({
    Key? key,
    this.initialRoute,
    this.routes,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: !kReleaseMode,
        title: 'Flutter chat app',
        initialRoute: widget.initialRoute ?? Routes.login,
        routes: widget.routes ?? appRoutes,
      );
    });
  }
}
