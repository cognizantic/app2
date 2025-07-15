import '/barrel1.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool _hover2 = false;
  bool _choice = false;

  Future<void> _press2(String code) async {
    try {
      final response = await post(
        Uri.parse('$baseurl/verification'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': await getUsername(), 'code': code}),
      );
      status = response.statusCode;
    } catch (e) {
      status = 500;
    }
  }

  TextEditingController text1 = TextEditingController();

  @override
  void dispose() {
    text1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("verify"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            removeUsername();
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter the code sent to your registered mail",
              style: TextStyle(),
            ),
            SizedBox(
              width: 300,
              child: AnimatedContainer(
                padding: EdgeInsets.only(bottom: 5, top: 10),
                duration: Duration(milliseconds: 300),
                child: TextFormField(
                  style: TextStyle(),
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
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "verification code",
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: AnimatedContainer(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                      color: _choice ? Color(secondary) : Color(primary),
                    ),
                    duration: Duration(milliseconds: 300),
                    child: GestureDetector(
                      onTap: () => {
                        setState(() {
                          _choice = !_choice;
                        }),
                      },
                      child: MouseRegion(
                        onEnter: (_) => {},
                        onExit: (_) => {},
                        cursor: SystemMouseCursors.click,
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 300),
                          style: TextStyle(
                            color: _choice ? Color(primary) : Color(secondary),
                          ),
                          child: Center(
                            child: _choice
                                ? Text("send password")
                                : Text("Change Password"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 150,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: _hover2 ? Color(secondary) : Color(primary),
                  border: Border.all(
                    color: _hover2 ? Color(primary) : Color(secondary),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(vertical: 7),
                duration: Duration(milliseconds: 300),
                child: GestureDetector(
                  onTap: () async {
                    await _press2(text1.text);
                    if (status == 200) {
                      status = 0;
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                _choice ? SendPass() : ChangePass(),
                          ),
                        );
                      }
                    } else if (status == 300) {
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                "wrong code",
                                style: TextStyle(),
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
                    } else {
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                "unexpected error",
                                style: TextStyle(),
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
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _hover2 ? Color(primary) : Color(secondary),
                      ),
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
