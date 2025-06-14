import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/barrel1.dart';
import '/globals.dart';

var status = 0;

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hover1 = false;
  bool _hover2 = false;
  bool _checkrem = false;
  Future<void> _press1(String username, String passcode) async {
    try {
      final response = await http.post(
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
                              onPressed: () {
                                _press1(text1.text, text2.text);
                                if (status == 500) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: const Text(
                                          "error",
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
                                } else if (status == 200) {
                                  if (_checkrem) {
                                  } else {}
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Signin(),
                                    ),
                                  );
                                } else if (status == 300) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: const Text(
                                          "check username/password",
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
                                } else if (status == 302) {
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
                AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Forgot1(),
                        ),
                      );
                    },
                    child: MouseRegion(
                      onEnter: (_) {},
                      onExit: (_) {},
                      child: Text(
                        'forget password',
                        style: TextStyle(color: Colors.grey),
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
