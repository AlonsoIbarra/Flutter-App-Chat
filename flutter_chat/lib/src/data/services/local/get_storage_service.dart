import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageService {
  GetStorageService._privateConstructor();

  static User maybeGetLoggedUser() {
    final GetStorage getStorage = GetStorage();
    final user = User.fromJson(getStorage.read('user') ??
        {
          'user': '',
          'email': '',
          'name': '',
          'phone': '',
        });
    return user;
  }

  static void saveGetLoggedUser(User? user) {
    final GetStorage getStorage = GetStorage();
    getStorage.write('user', user!.toJson());
  }
}
