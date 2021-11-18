import 'package:flutter/material.dart';
import 'package:flutter_todo_api/api_manager/todo_helper.dart';
import 'package:flutter_todo_api/model/todo_model.dart';

final _todo = TextEditingController();
final _formKey = GlobalKey<FormState>();
addUpdateTodo(BuildContext context, Function refresh, {int id = -1}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: const Text(
          'Task',
        ),
        content: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Titile',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                  maxLines: 3,
                  controller: _todo,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
              child: const Text(
                "Done",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addTodo(context, refresh, id);
                }
              })
        ],
      );
    },
  );
}

_addTodo(BuildContext context, Function refresh, int id) async {
  Todo todo = Todo(title: _todo.text, id: id);
  int res = id == -1
      ? await TodoManager().addTodo(todo)
      : await TodoManager().updateTodo(todo);
  Navigator.of(context).pop();

  if (res == 0) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('some error occured')));
  } else {
    await refresh();
  }
  _todo.clear();
}
