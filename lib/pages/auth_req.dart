import 'package:flutter/material.dart';
import 'package:flutter_todo_api/pages/login_page.dart';
import 'package:flutter_todo_api/pages/register_page.dart';

class AuthReq extends StatelessWidget {
  const AuthReq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            _logButton(context),
            const SizedBox(height: 30),
            _regButton(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  _regButton(BuildContext context) => TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          );
        },
        child: const Text(
          'Register',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  _logButton(BuildContext context) => TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LoginPage(),),
          );
        },
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
