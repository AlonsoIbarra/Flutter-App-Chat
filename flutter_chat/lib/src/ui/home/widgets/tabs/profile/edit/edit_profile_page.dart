import 'package:flutter/material.dart';
import 'package:flutter_chat/src/repositories_injection.dart';
import 'package:flutter_chat/src/ui/home/widgets/tabs/profile/edit/widgets/edit_profile_form.dart';
import 'package:sizer/sizer.dart';

import 'update_profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key, UpdateProfileController? updateProfileController})
      : updateProfileController = updateProfileController ??
            UpdateProfileController(
              RepositoriesGetter.userRepository,
            );
  final UpdateProfileController updateProfileController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Center(
            child: EditProfileForm(
              updateProfileController: updateProfileController,
            ),
          ),
        ),
      ),
    );
  }
}
