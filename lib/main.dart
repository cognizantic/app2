// ignore_for_file: library_private_types_in_public_api, unused_import, use_build_context_synchronously//
import '/barrel1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? username = await getUsername();
  if (username == null || username.isEmpty) {
    runApp(const MaterialApp(home: Login()));
  } else {
    runApp(const MaterialApp(home: Signin()));
  }
}
