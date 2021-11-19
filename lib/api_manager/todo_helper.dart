import 'dart:convert';
import 'package:flutter_todo_api/strings.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_todo_api/model/todo_model.dart';

class TodoManager {
  Future<int> addTodo(Todo todo) async {
    String json = jsonEncode(todo);
    var response = await http.post(Uri.parse('${base_url}todo/create/'),
        headers: {
          "Authorization": "Token $token",
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json);
    print(' add response ${response.statusCode}');
    if (response.statusCode == 200) {
      return 1;
    }
    return 0;
  }

  Future<List<Todo>> getTodo() async {
    List<Todo> todos = [];
    await getToken();
    var client = http.Client();
    var response = await client.get(
      Uri.parse('${base_url}todo/'),
      headers: {
        "Authorization": "Token $token",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      //print(response.body);
      List todo = jsonDecode(response.body);
      for (var item in todo) {
        todos.add(Todo(title: item['title'], id: item['id']));
      }
      return todos;
    }
    return todos;
  }

  Future<int> deleteTodo(int id) async {
    var response = await http.delete(
      Uri.parse('${base_url}todo/$id/'),
      headers: {
        "Authorization": "Token $token",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 204) {
      return 1;
    }
    return 0;
  }

  Future<int> updateTodo(Todo todo) async {
    print(todo.id);
    print(jsonEncode(todo));
    var response = await http.patch(
      Uri.parse("${base_url}todo/${todo.id}/"),
      headers: {
        "Authorization": "Token $token",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(todo),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return 1;
    }
    return 0;
  }
}
