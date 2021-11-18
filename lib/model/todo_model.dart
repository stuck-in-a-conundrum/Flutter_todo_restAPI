class User {
  final int? id;
  final String? name;
  final String? email;
  final String username;
  final String? password;

  const User(
      {this.id, this.name, this.email, required this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
      );
  
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'username': username,
        'password': password,
      };
}

class Todo {
  final int? id;
  final String title;

  const Todo({this.id, required this.title});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(id: json["id"], title: json['title']);

  Map<String, dynamic> toJson() => {'id': id, 'title': title};
}
