import '/barrel1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checknclear();
  String? username = await getUsername();
  if (username == null || username.isEmpty) {
    runApp(const MaterialApp(home: Login()));
  } else {
    runApp(const MaterialApp(home: Signin()));
  }
}
