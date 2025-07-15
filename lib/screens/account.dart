import '/barrel1.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      drawer: AppBar1(text2disp: 'Account'),
    );
  }
}
