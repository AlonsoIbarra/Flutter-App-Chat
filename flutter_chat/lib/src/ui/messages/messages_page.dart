import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:flutter_chat/src/repositories_injection.dart';
import 'package:flutter_chat/src/ui/messages/messages_controller.dart';
import 'package:flutter_chat/src/ui/messages/widgets/message_input_box.dart';
import 'package:sizer/sizer.dart';

import 'widgets/app_bar.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({super.key, MessagesController? messagesController})
      : messagesController = messagesController ??
            MessagesController(
              RepositoriesGetter.messagesRepository,
            );
  final MessagesController messagesController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.chatBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              MessagesAppBar(
                user: messagesController.user,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 2.h,
                  ),
                ),
              ),
              MessageInputBox(),
            ],
          ),
        ));
  }
}
