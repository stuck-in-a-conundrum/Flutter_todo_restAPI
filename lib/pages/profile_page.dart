import 'package:flutter/material.dart';
import 'package:flutter_todo_api/api_manager/user_helper.dart';
import 'package:flutter_todo_api/model/todo_model.dart';
import 'package:flutter_todo_api/widgets/profile_detail.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: profileData(context),
        ),
      ),
    );
  }

  profileData(BuildContext context) {
    //User user = await UserManager().getProfile();
    return FutureBuilder<User>(
        future: UserManager().getProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.username.isNotEmpty) {
              return buildText(snapshot.data!);
            } else {
              return const Center(
                child: Text("some error occured"),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
