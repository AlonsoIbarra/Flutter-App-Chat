import 'package:flutter/material.dart';

import '../../../../../../domain/models/user/user.dart';
import '../../profile/view/widgets/circle_image_user.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleImageUser(
        profileUserImage: user.image ?? "",
      ),
    );
  }
}
