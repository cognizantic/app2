import '/barrel1.dart';

class AppBar1 extends StatefulWidget {
  final String text2disp;
  const AppBar1({super.key, required this.text2disp});
  @override
  _AppBar1State createState() => _AppBar1State();
}

class _AppBar1State extends State<AppBar1> {
  late bool _hover1;
  late bool _hover2;
  late bool _hover3;
  late bool _hover4;

  @override
  void initState() {
    super.initState();
    _hover4 = widget.text2disp == 'Settings' ? true : false;
    _hover3 = widget.text2disp == 'Home' ? true : false;
    _hover2 = widget.text2disp == 'Account' ? true : false;
    _hover1 = widget.text2disp == 'Sign out' ? true : false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                widget.text2disp,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _hover3 = !_hover3;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _hover3 = !_hover3;
                  });
                },
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  width: 4,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _hover3 ? Colors.grey : Colors.black,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  curve: Curves.easeInOut,
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        color: _hover3 ? Colors.black : Colors.grey,
                      ),
                      child: const Text("Home"),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _hover4 = !_hover4;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _hover4 = !_hover4;
                  });
                },
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  width: 4,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _hover4 ? Colors.grey : Colors.black,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  curve: Curves.easeInOut,
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        color: _hover4 ? Colors.black : Colors.grey,
                      ),
                      child: const Text("Settings"),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Account()),
                );
              },
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _hover2 = !_hover2;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _hover2 = !_hover2;
                  });
                },
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  width: 4,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _hover2 ? Colors.grey : Colors.black,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  curve: Curves.easeInOut,
                  child: ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        color: _hover2 ? Colors.black : Colors.grey,
                      ),
                      child: const Text("Account"),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                removeUsername();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _hover1 = !_hover1;
                  });
                },
                onExit: (_) {
                  setState(() {
                    {
                      _hover1 = !_hover1;
                    }
                  });
                },
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  width: 4,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _hover1 ? Colors.grey : Colors.black,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  curve: Curves.easeInOut,
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        color: _hover1 ? Colors.black : Colors.grey,
                      ),
                      child: const Text("sign out"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
