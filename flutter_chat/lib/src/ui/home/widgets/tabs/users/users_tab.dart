import 'package:flutter/material.dart';
import 'package:flutter_chat/src/repositories_injection.dart';
import 'package:flutter_chat/src/ui/home/widgets/tabs/users/users_tab_controller.dart';
import 'package:flutter_chat/src/ui/home/widgets/tabs/users/widgets/user_card.dart';

class UsersTab extends StatelessWidget {
  UsersTab({Key? key, UsersTabController? userController})
      : userController = userController ??
            UsersTabController(RepositoriesGetter.userRepository);
  final UsersTabController userController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userController.listAllUsers(),
        builder: (context, asyncSnapShot) {
          if (asyncSnapShot.hasData && asyncSnapShot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: asyncSnapShot.data!.length,
              itemBuilder: (_, index) {
                return UserCard(
                  user: asyncSnapShot.data!.elementAt(index),
                );
              },
            );
          }
          return Center(
            child: Column(
              children: const [
                Icon(
                  Icons.block_flipped,
                ),
                Text('No content.')
              ],
            ),
          );
        },
      ),
    );
  }
}
