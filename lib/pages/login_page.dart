import 'package:flutter/material.dart';
import 'package:flutter_todo_api/api_manager/user_helper.dart';
import 'package:flutter_todo_api/model/todo_model.dart';
import 'package:flutter_todo_api/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter username';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'username',
                  ),
                  controller: _username,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'password',
                  ),
                  obscureText: true,
                  controller: _password,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          submit();
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false);
  }

  submit() async {
    final user = User(username: _username.text, password: _password.text);
    String res = await UserManager().login(user);
    if (res == '1') {
      Navigator.of(context).pushAndRemoveUntil<void>(
        MaterialPageRoute(
          builder: (context) => HomePage(
            isNew: true,
          ),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res == 0 ? 'Error occured' : res)),
      );
    }
  }
}
