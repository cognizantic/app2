import '/barrel1.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          AppBar(backgroundColor: Colors.grey, title: const Text("Settings")),
      drawer: AppBar1(text2disp: 'Settings'),
      body: Center(
          child: Scaffold(
              backgroundColor: Colors.black, body: SingleChildScrollView())),
    );
  }
}
