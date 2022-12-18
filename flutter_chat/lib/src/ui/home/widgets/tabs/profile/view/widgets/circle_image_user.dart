import 'package:flutter/material.dart';

import '../../../../../../../config/utils/app_image_routes.dart';

class CircleImageUser extends StatelessWidget {
  final String profileUserImage;
  const CircleImageUser({Key? key, required this.profileUserImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipOval(
        child: (profileUserImage.isNotEmpty)
            ? FadeInImage.assetNetwork(
                placeholder: AppImageRoutes.loginImage,
                image: profileUserImage,
              )
            : Image.asset(AppImageRoutes.imageProfileDefault),
      ),
    );
  }
}
