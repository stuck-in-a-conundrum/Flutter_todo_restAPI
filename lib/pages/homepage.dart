import 'package:flutter/material.dart';
import 'package:flutter_todo_api/api_manager/todo_helper.dart';
import 'package:flutter_todo_api/model/todo_model.dart';
import 'package:flutter_todo_api/pages/profile_page.dart';
import 'package:flutter_todo_api/strings.dart';
import 'package:flutter_todo_api/widgets/add_update_dialog.dart';
import 'package:flutter_todo_api/pages/auth_req.dart';
import 'package:flutter_todo_api/widgets/todo_listview.dart';

class HomePage extends StatefulWidget {
  bool isNew;
  HomePage({Key? key, required this.isNew}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];
  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future refresh() async {
    List<Todo> _todos = await TodoManager().getTodo();
    setState(() => todos = _todos);
    //List.generate(_todos.length, (index) => _todos[index].title));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          icon: const Icon(
            Icons.account_circle,
            size: 35,
          ),
          tooltip: "profile",
        ),
        title: const Text('To-Do'),
        actions: [_logoutButton()],
      ),
      body: todos.isNotEmpty
          ? todoList(context, todos, refresh)
          : widget.isNew
              ? const Center(
                  child: Text('No tasks yet'),
                )
              : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addUpdateTodo(context, refresh),
        child: const Icon(Icons.add),
      ),
    );
  }

  _logoutButton() => IconButton(
        onPressed: () async {
          await addToken('');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AuthReq()));
        },
        icon: const Icon(Icons.logout),
        tooltip: "logout",
      );
}
