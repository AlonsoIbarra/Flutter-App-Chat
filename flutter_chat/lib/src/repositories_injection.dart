import 'package:dio/dio.dart';
import 'package:flutter_chat/src/data/repositories/auth_repository.dart';
import 'package:flutter_chat/src/data/repositories/messages_repository.dart';
import 'package:flutter_chat/src/data/repositories/user_repository.dart';
import 'package:flutter_chat/src/data/services/remote/auth_service.dart';
import 'package:flutter_chat/src/data/services/remote/message_service.dart';
import 'package:flutter_chat/src/data/services/remote/user_service.dart';
import 'package:flutter_chat/src/domain/abstract_repositories/abstract_auth_repository.dart';
import 'package:flutter_chat/src/domain/abstract_repositories/abstract_user_repository.dart';
import 'package:get/get.dart';
import 'data/http_client/http.dart';
import 'domain/abstract_repositories/abstract_messages_repository.dart';

Future<void> repositoriesInjection({
  required Dio dio,
}) async {
  final http = Http(
    dio,
  );

  Get.lazyPut<AbstractUserRepository>(
    () => UserRepository(
      UserService(http),
    ),
  );
  Get.lazyPut<AbstractAuthRepository>(
    () => AuthRepository(
      AuthService(http),
    ),
  );
  Get.lazyPut<AbstractMessagesRepository>(
    () => MessagesRepository(
      MessageService(http),
    ),
  );
}

class RepositoriesGetter {
  RepositoriesGetter._();

  static AbstractUserRepository get userRepository =>
      Get.find<AbstractUserRepository>();
  static AbstractAuthRepository get authRepository =>
      Get.find<AbstractAuthRepository>();
  static AbstractMessagesRepository get messagesRepository =>
      Get.find<AbstractMessagesRepository>();
}
