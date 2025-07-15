import '/barrel1.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: AppBar1(text2disp: 'Home'),
      body: const Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: []),
      ),
    );
  }
}
