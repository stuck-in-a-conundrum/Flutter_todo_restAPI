import 'package:shared_preferences/shared_preferences.dart';

String token = '';
const String base_url = 'https://todo-app-csoc.herokuapp.com/';

Future getToken() async {
  final pref = await SharedPreferences.getInstance();
  token = pref.getString('token') ?? '';

  ///return token;
}

Future addToken(String _token) async {
  final pref = await SharedPreferences.getInstance();
  await pref.setString('token', _token);
  await getToken();
}
