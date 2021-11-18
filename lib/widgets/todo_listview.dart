import 'package:flutter/material.dart';
import 'package:flutter_todo_api/api_manager/todo_helper.dart';
import 'package:flutter_todo_api/model/todo_model.dart';
import 'package:flutter_todo_api/widgets/add_update_dialog.dart';

todoList(BuildContext context, List<Todo> todos, Function refresh) {
  return ListView.builder(
    itemCount: todos.length,
    itemBuilder: (context, index) => Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(top: 5, left: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //color: Colors.blueAccent,
          gradient: LinearGradient(
              colors: [Colors.lightBlue, Colors.white],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              todos[index].title,
              style: const TextStyle(
                fontSize: 25,
              ),
              //overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () =>
                    addUpdateTodo(context, refresh, id: todos[index].id!),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                onPressed: () async {
                  int del = await TodoManager().deleteTodo(todos[index].id!);
                  (del == 0)
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('some error occured'),
                          ),
                        )
                      : refresh();
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
