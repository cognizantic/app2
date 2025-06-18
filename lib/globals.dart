import 'package:shared_preferences/shared_preferences.dart';

final baseurl = 'http://127.0.0.1:3443';
var status = 0;
Future<void> saveUsername(String username) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
}

Future<String?> getUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

Future<void> removeUsername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
}
