import 'package:get/get.dart';

import '../../domain/models/user/user.dart';

class HomeController extends GetxController {
  final User? _user;
  var tabIndex = 0.obs;

  HomeController({
    User? user,
  }) : _user = user;
  void changeTab(int index) {
    tabIndex.value = index;
  }
}
