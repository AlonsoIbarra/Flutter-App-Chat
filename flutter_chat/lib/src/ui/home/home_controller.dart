import 'package:get/get.dart';

import '../../domain/models/user/user.dart';

class HomeController extends GetxController {
  final User? _user;

  HomeController({
    User? user,
  }) : _user = user;
}
