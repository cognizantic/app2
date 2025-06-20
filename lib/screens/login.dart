import '/barrel1.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hover1 = false;
  bool _hover2 = false;
  bool _checkrem = false;
  bool _hover3 = false;

  Future<void> _press1(String username, String passcode) async {
    try {
      final response = await post(
        Uri.parse('$baseurl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': passcode}),
      );
      status = response.statusCode;
    } catch (e) {
      status = 500;
    }
  }

  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Form(
          child: SizedBox(
            width: 300,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "WELCOME",
                    style: GoogleFonts.lobster(
                      textStyle: const TextStyle(
                        fontSize: 32,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                    controller: text1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'username',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                    controller: text2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'password',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _checkrem,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _checkrem = newValue!;
                          if (_checkrem) {
                            saveUsername(text1.text);
                          } else {
                            removeUsername();
                          }
                        });
                      },
                    ),
                    const Text(
                      "remember me",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MouseRegion(
                          onEnter: (_) => setState(() => _hover1 = true),
                          onExit: (_) => setState(() => _hover1 = false),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 5),
                            child: ElevatedButton(
                              onPressed: () async {
                                await _press1(text1.text, text2.text);
                                if (status == 500) {
                                  if (context.mounted) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: const Text(
                                            "error",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
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
                                } else if (status == 200) {
                                  if (context.mounted) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Signin(),
                                      ),
                                    );
                                  }
                                } else if (status == 300 || status == 301) {
                                  if (context.mounted) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: const Text(
                                            "check username/password",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
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
                                } else if (status == 302) {
                                  if (context.mounted) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: const Text(
                                            "no username found",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
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
                                }
                              },
                              style: _hover1
                                  ? ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                              child: const Text("sign in"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MouseRegion(
                          onEnter: (_) => setState(() => _hover2 = true),
                          onExit: (_) => setState(() => _hover2 = false),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Signup(),
                                  ),
                                );
                              },
                              style: _hover2
                                  ? ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                              child: const Text("sign up"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Forgot1()),
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
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: _hover3 ? Colors.grey : Colors.black,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 5,
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Text(
                        'forget password',
                        style: TextStyle(
                          color: _hover3 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
