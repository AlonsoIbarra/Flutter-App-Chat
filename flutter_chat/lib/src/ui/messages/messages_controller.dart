import 'package:flutter_chat/src/domain/abstract_repositories/abstract_messages_repository.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:get/get.dart';

class MessagesController extends GetxController {
  final AbstractMessagesRepository messagesRepository;
  final User user = User.fromJson(Get.arguments['user']);

  MessagesController(this.messagesRepository);
}
