import 'package:flutter_chat/src/domain/abstract_repositories/abstract_user_repository.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:get/get.dart';

class UsersTabController extends GetxController {
  UsersTabController(this.userRepository);
  final AbstractUserRepository userRepository;

  Future<List<User>> listAllUsers() async {
    final result = await userRepository.listAllUsers();
    return result.when((httpError) {
      httpError.whenOrNull(
        network: () => Get.snackbar('Error', 'Network'),
        notFound: () => Get.snackbar('Error', 'notFound'),
        serverError: () => Get.snackbar('Error', 'Server error'),
        unhandled: () => Get.snackbar('Error', 'Unhandled'),
        customError: (_) => Get.snackbar('Error', 'Custom error'),
      );
      return [];
    }, (users) => users);
  }
}
