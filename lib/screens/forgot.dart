import 'package:http/http.dart' as http;
import '/barrel1.dart';

class Forgot1 extends StatefulWidget {
  const Forgot1({super.key});
  @override
  _Forgot1State createState() => _Forgot1State();
}

class _Forgot1State extends State<Forgot1> {
  bool _hover1 = false;
  bool _hover2 = false;
  final TextEditingController text1 = TextEditingController();
  @override
  void dispose() {
    text1.dispose();
    super.dispose();
  }

  Future<void> _press2(String username) async {
    try {
      saveUsername(username);
      final response = await http.post(
        Uri.parse('$baseurl/forgot-password'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username}),
      );
      status = response.statusCode;
      if (status == 300) {
        removeUsername();
      }
    } catch (e) {
      removeUsername();
      status = 500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //drawer:,
      body: Center(
        child: Row(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text1,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          } else if (status == 300) {
                            status = 0;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "username",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      child: GestureDetector(
                        onTap: () {
                          _press2(text1.text);
                          if (status == 200) {
                            status = 0;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Verification(),
                              ),
                            );
                          } else if (status == 300) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text(
                                    "no username found",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text(
                                    "unexpected error",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: MouseRegion(
                          onEnter: (_) => {
                            setState(() {
                              _hover2 = !_hover2;
                            }),
                          },
                          onExit: (_) => {
                            setState(() {
                              _hover2 = !_hover2;
                            }),
                          },
                          child: Text(
                            "submit",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
