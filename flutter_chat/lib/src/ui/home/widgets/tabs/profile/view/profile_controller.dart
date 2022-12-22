import 'package:flutter_chat/src/config/routes/routes.dart';
import 'package:flutter_chat/src/data/services/local/get_storage_service.dart';
import 'package:flutter_chat/src/data/services/local/multimedia_service.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final MultimediaService multimediaService;
  final Rx<User> user = GetStorageService.maybeGetLoggedUser().obs;

  ProfileController({MultimediaService? multimediaService})
      : multimediaService = multimediaService ?? MultimediaService();

  void signOut() {
    GetStorageService.deleteGetLoggedUser();
    Get.offNamedUntil(
      Routes.login,
      (route) => false,
    );
  }
}
