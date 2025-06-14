// ignore_for_file: library_private_types_in_public_api, unused_import, use_build_context_synchronously//

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final baseurl = 'http://127.0.0.1:3443';
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
                  child: MouseRegion(
                    child: GestureDetector(
                      onTap: () {},
                      child: MouseRegion(
                        onEnter: (_) {},
                        onExit: (_) {},
                        child: Text('forget password'),
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

class Signin extends StatefulWidget {
  const Signin({super.key});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _hover1 = false;
  bool _hover2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.grey, title: const Text("home")),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("home", style: TextStyle(color: Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Account()),
                );
              },
              child: MouseRegion(
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
                      child: const Text("account"),
                    ),
                  ),
                ),
                onEnter: (_) {
                  setState(() => _hover2 = true);
                },
                onExit: (_) {
                  setState(() => _hover2 = false);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: MouseRegion(
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
                onEnter: (_) {
                  setState(() => _hover1 = true);
                },
                onExit: (_) {
                  setState(() => _hover1 = false);
                },
              ),
            ),
          ],
        ),
      ),
      body: const Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: []),
      ),
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _hover1 = false;
  bool _checkpass(String pass1, String pass2) {
    if (pass1 == pass2) {
      return true;
    }
    return false;
  }

  Future<int> sumbit(
    String username,
    String firstname,
    String lastname,
    String dob,
    String email,
    String passcode,
    String phonenumber,
    String address,
    String state,
    String country,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseurl/sign-up'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'firstname': firstname,
          'lastname': lastname,
          'dob': dob,
          'email': email,
          'password': passcode,
          'phonenumber': phonenumber,
          'address': address,
          'state': state,
          'country': country,
        }),
      );
      status = response.statusCode;
      return status;
    } catch (e) {
      return 500;
    }
  }

  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();
  final TextEditingController text3 = TextEditingController();
  final TextEditingController text4 = TextEditingController();
  final TextEditingController text5 = TextEditingController();
  final TextEditingController text6 = TextEditingController();
  final TextEditingController text7 = TextEditingController();
  final TextEditingController text8 = TextEditingController();
  final TextEditingController text9 = TextEditingController();
  final TextEditingController text10 = TextEditingController();
  final TextEditingController text11 = TextEditingController();
  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();
    text5.dispose();
    text6.dispose();
    text7.dispose();
    text8.dispose();
    text9.dispose();
    text10.dispose();
    text11.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 30),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text1,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          } else if (status == 300 ||
                              status == 302 ||
                              status == 304 ||
                              status == 306) {
                            status = 0;
                            return 'username already exists';
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
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text2,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "first name",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text3,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "last name",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text8,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          } else if (!RegExp(r'^\d+$').hasMatch(val)) {
                            return 'check';
                          } else if (status == 300 ||
                              status == 303 ||
                              status == 304 ||
                              status == 305) {
                            status = 0;
                            return 'already exists';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "phone number",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text9,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "address",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text10,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "state",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text11,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "country",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text4,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          }
                          if (val.isNotEmpty) {
                            try {
                              final parts = val.split('-');
                              final day = int.parse(parts[1]);
                              final month = int.parse(parts[0]);
                              final year = int.parse(parts[2]);
                              final parsedDate = DateTime(year, month, day);
                              if (parsedDate.day != day ||
                                  parsedDate.month != month ||
                                  parsedDate.year != year) {
                                return 'Invalid date';
                              }
                            } catch (_) {
                              return 'Invalid date';
                            }
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "DOB(MM-DD-YYYY)",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text5,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          } else if (!val.contains("@")) {
                            return 'enter proper email';
                          } else if (status == 301 ||
                              status == 300 ||
                              status == 305 ||
                              status == 306) {
                            status = 0;
                            return 'email already exists';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text6,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "password",
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                        controller: text7,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'required';
                          }
                          if (val.isNotEmpty && text6.text != text7.text) {
                            return 'check password';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "confirm password",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 50),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() => _hover1 = true);
                        },
                        onExit: (_) {
                          setState(() => _hover1 = false);
                        },
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_checkpass(text6.text, text7.text)) {
                                status = await sumbit(
                                  text1.text,
                                  text2.text,
                                  text3.text,
                                  text4.text,
                                  text5.text,
                                  text6.text,
                                  text8.text,
                                  text9.text,
                                  text10.text,
                                  text11.text,
                                );
                                if (status == 200) {
                                  Navigator.pushReplacement(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );
                                }
                              } else {
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
                              }
                            } else {}
                          },
                          child: AnimatedContainer(
                            height: 50,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                              color: _hover1 ? Colors.black : Colors.grey,
                            ),
                            child: Center(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                style: TextStyle(
                                  color: _hover1 ? Colors.grey : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                child: const Text("Submit"),
                              ),
                            ),
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
      ),
    );
  }
}

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _hover1 = false;
  bool _hover2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("account"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("account", style: TextStyle(color: Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: MouseRegion(
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
                      child: const Text("home"),
                    ),
                  ),
                ),
                onEnter: (_) {
                  setState(() => _hover2 = true);
                },
                onExit: (_) {
                  setState(() => _hover2 = false);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: MouseRegion(
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
                onEnter: (_) {
                  setState(() => _hover1 = true);
                },
                onExit: (_) {
                  setState(() => _hover1 = false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() async {
  runApp(const MaterialApp(home: Login()));
}
