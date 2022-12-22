import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/models/user/user.dart';
import '../../home/widgets/tabs/profile/view/widgets/circle_image_user.dart';

class MessagesAppBar extends StatelessWidget {
  const MessagesAppBar({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            user.name,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.chatAppBarColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'disconnected',
            style: TextStyle(
              color: AppColors.userStatusColor,
            ),
          ),
          trailing: AspectRatio(
            aspectRatio: 1,
            child: CircleImageUser(
              profileUserImage: user.image ?? "",
            ),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ],
    );
  }
}
