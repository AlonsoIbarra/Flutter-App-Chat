import 'package:flutter/material.dart';

import '../../../../../../config/utils/app_image_routes.dart';

class CircleImageUser extends StatelessWidget {
  final String imageProfilePath;
  const CircleImageUser({Key? key, required this.imageProfilePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipOval(
        child: FadeInImage.assetNetwork(
          placeholder: AppImageRoutes.loginImage,
          image: imageProfilePath,
        ),
      ),
    );
  }
}
