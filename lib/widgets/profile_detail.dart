import 'package:flutter/material.dart';
import 'package:flutter_todo_api/model/todo_model.dart';

Widget buildText(User user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          const Text("Username:"),
          Text(user.username),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          const Text("Name:"),
          Text("${user.name}"),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          const Text("Email:"),
          Text("${user.email}"),
        ],
      )
    ],
  );
}
