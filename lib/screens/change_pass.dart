import '/barrel1.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text("change password"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: Center(child: Column()));
  }
}
