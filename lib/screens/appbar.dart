import '/barrel1.dart';

class AppBar1 extends StatefulWidget {
  final String text2disp;
  const AppBar1({super.key, required this.text2disp});
  @override
  _AppBar1State createState() => _AppBar1State();
}

class _AppBar1State extends State<AppBar1> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ListView(
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.surface),
            child: Text(
              widget.text2disp,
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(200, 50)),
                  minimumSize: WidgetStatePropertyAll(Size(150, 50))),
              icon: Icon(Icons.home),
              iconAlignment: IconAlignment.start,
              label: Text(
                "Home",
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: ElevatedButton.icon(
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FileExplorer(),
                  ),
                );
              },
              style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(200, 50)),
                  minimumSize: WidgetStatePropertyAll(Size(150, 50))),
              icon: Icon(Icons.folder),
              iconAlignment: IconAlignment.start,
              label: Text(
                "Files",
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
              style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(200, 50)),
                  minimumSize: WidgetStatePropertyAll(Size(150, 50))),
              icon: Icon(Icons.settings),
              iconAlignment: IconAlignment.start,
              label: Text(
                "Settings",
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Account()),
                );
              },
              style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(200, 50)),
                  minimumSize: WidgetStatePropertyAll(Size(150, 50))),
              icon: Icon(Icons.account_circle),
              iconAlignment: IconAlignment.start,
              label: Text(
                "Account",
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: ElevatedButton.icon(
              onPressed: () {
                removeUsername();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(200, 50)),
                  minimumSize: WidgetStatePropertyAll(Size(150, 50))),
              icon: Icon(Icons.logout),
              iconAlignment: IconAlignment.start,
              label: Text(
                "Sign out",
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
