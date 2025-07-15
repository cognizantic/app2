import '/barrel1.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKeys = List.generate(6, (_) => GlobalKey<FormState>());
  bool _checkpass(String pass1, String pass2) {
    if (pass1 == pass2) {
      return true;
    }
    return false;
  }

  var status = 0;
  int _step = 0;
  bool _pass1 = false;
  bool _pass2 = false;
  String? flag;
  String? phCode;

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
      final response = await post(
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

  Future<int> checkAvaliabilty(int which, String value) async {
    try {
      if (which == 1) {
        final response = await post(
          Uri.parse('$baseurl/check-username'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': value,
          }),
        );
        return response.statusCode;
      } else if (which == 2) {
        final response = await post(
          Uri.parse('$baseurl/check-email'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': value,
          }),
        );
        return response.statusCode;
      } else if (which == 3) {
        final response = await post(
          Uri.parse('$baseurl/check-phone'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'phonenumber': value,
          }),
        );
        return response.statusCode;
      }
      return 500; // Return a default error code if none of the conditions match
    } catch (e) {
      return 500;
    }
  }

  void _nextPage() {
    setState(() {
      _step++;
      status = 0;
    });
  }

  void _previousPage() {
    setState(() {
      _step--;
      status = 0;
    });
  }

  Widget _centerContent() {
    switch (_step) {
      case 0:
        return SizedBox(
          //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          height: 425,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 425, width: 60),
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKeys[0],
                  child: Column(
                    children: [
                      Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(child: Text("NAME"))),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 30),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            controller: text1,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'required';
                              } else if (status == 302) {
                                status = 0;
                                return 'username already exists';
                              } else if (status == 500) {
                                return 'error';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "username",
                                suffixIcon: Icon(
                                    color: Color(0xFF003739),
                                    Icons.account_box_outlined)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            controller: text2,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "first name",
                              suffixIcon:
                                  Icon(color: Color(0xFF003739), Icons.abc),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            controller: text3,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "last name",
                              suffixIcon:
                                  Icon(color: Color(0xFF003739), Icons.abc),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 425,
                padding: EdgeInsets.only(left: 5),
                child: IconButton(
                  onPressed: () async {
                    if (_formKeys[0].currentState!.validate()) {
                      status = await checkAvaliabilty(1, text1.text);
                      if (status != 302 && status != 500) {
                        _nextPage();
                      } else if (_formKeys[0].currentState!.validate()) {}
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 1:
        return SizedBox(
          //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          height: 425,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 425,
                padding: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {
                    _previousPage();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKeys[1],
                  child: Column(
                    children: [
                      Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(child: Text("CONTACT"))),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            controller: text8,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return null;
                              } else {
                                if (!RegExp(r'^\d+$').hasMatch(val)) {
                                  return 'check number';
                                } else if (status == 304) {
                                  status = 0;
                                  return 'already exists';
                                } else if ((phCode?.contains("00") ?? true)) {
                                  return 'enter code';
                                } else if (status == 500) {
                                  return 'error';
                                }
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "phone number",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      setState(() {
                                        phCode = country.phoneCode;
                                      });
                                    },
                                  );
                                },
                                icon: Icon(
                                  color: Color(0xFF00BFA6),
                                  Icons.phone_android_sharp,
                                ),
                              ),
                              prefixText:
                                  phCode != null ? "+${phCode!}" : "+00",
                              prefixStyle: TextStyle(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            controller: text5,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'required';
                              } else if (!val.contains("@")) {
                                return 'Invalid Email';
                              } else if (status == 301) {
                                status = 0;
                                return 'email already exists';
                              } else if (status == 500) {
                                return 'error';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Email",
                              suffixIcon: Icon(
                                  color: Color(0xFF00BFA6),
                                  Icons.email_outlined),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 425,
                padding: EdgeInsets.only(left: 5),
                child: IconButton(
                  onPressed: () async {
                    status = await checkAvaliabilty(2, text5.text);
                    if (_formKeys[1].currentState!.validate()) {
                      if (text8.text.isNotEmpty) {
                        status = await checkAvaliabilty(3, text8.text);
                        if (_formKeys[1].currentState!.validate()) {
                          _nextPage();
                        }
                      } else if (text8.text.isEmpty) {
                        if (_formKeys[1].currentState!.validate()) {
                          _nextPage();
                        }
                      }
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 2:
        return SizedBox(
          //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          height: 425,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 425,
                padding: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {
                    _previousPage();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKeys[2],
                  child: Column(
                    children: [
                      Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(child: Text("LOCATION"))),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            controller: text9,
                            validator: (val) {
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "address",
                              suffixIcon: Icon(
                                  color: Color(0xFF003739),
                                  Icons.home_work_outlined),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            controller: text10,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "state",
                              suffixIcon: Icon(
                                  color: Color(0xFF003739),
                                  Icons.location_on_outlined),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            controller: text11,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'required';
                              } else if ((flag?.isEmpty ?? true)) {
                                return 'choose country';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "country",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: false,
                                    onSelect: (Country country) {
                                      setState(() {
                                        text11.text = country.name;
                                        flag = country.flagEmoji;
                                      });
                                    },
                                  );
                                },
                                icon: Icon(
                                    color: Color(0xFF00BFA6),
                                    Icons.location_on),
                              ),
                              prefixText: flag != null ? "${flag!} " : "",
                              prefixStyle: TextStyle(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 425,
                padding: EdgeInsets.only(left: 5),
                child: IconButton(
                  onPressed: () {
                    if (_formKeys[2].currentState!.validate()) {
                      _nextPage();
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 3:
        return SizedBox(
          //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          height: 425,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 425,
                padding: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {
                    _previousPage();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKeys[3],
                  child: Column(
                    children: [
                      Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(child: Text("AGE"))),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
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
                            decoration: InputDecoration(
                              hintText: "DOB(MM-DD-YYYY)",
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                    helpText: "Select a Date",
                                  );
                                  text4.text =
                                      "${picked?.month.toString().padLeft(2, '0')}-${picked?.day.toString().padLeft(2, '0')}-${picked?.year}";
                                },
                                icon: Icon(
                                    color: Color(0xFF00BFA6),
                                    Icons.calendar_month_sharp),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 425,
                padding: EdgeInsets.only(left: 5),
                child: IconButton(
                  onPressed: () {
                    if (_formKeys[3].currentState!.validate()) {
                      _nextPage();
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 4:
        return SizedBox(
          //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          height: 425,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 425,
                padding: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {
                    _previousPage();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKeys[4],
                  child: Column(
                    children: [
                      Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(child: Text("PASSWORD"))),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            obscuringCharacter: "|",
                            obscureText: _pass1 ? false : true,
                            controller: text6,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "password",
                              suffixIcon: IconButton(
                                color: Color(0xFF00BFA6),
                                icon: Icon(_pass1
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _pass1 = !_pass1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 275,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                            obscuringCharacter: "|",
                            obscureText: _pass2 ? false : true,
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
                            decoration: InputDecoration(
                              hintText: "confirm password",
                              suffixIcon: IconButton(
                                color: Color(0xFF00BFA6),
                                icon: Icon(_pass2
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _pass2 = !_pass2;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 50),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKeys[4].currentState!.validate()) {
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
                                        content: Text(
                                          "error",
                                          style: TextStyle(),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'OK',
                                              style: TextStyle(),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {}
                            },
                            child: const Text("Submit"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 425,
              )
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: FittedBox(
          child: Container(
            width: 425,
            decoration: BoxDecoration(
              //color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onPrimary,
                  blurRadius: (20.0 * (_step + 1)),
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 1.0,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: _centerContent(),
          ),
        ),
      ),
    );
  }
}
