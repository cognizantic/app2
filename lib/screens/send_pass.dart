import '/barrel1.dart';

class SendPass extends StatefulWidget {
  const SendPass({super.key});
  @override
  _SendPassState createState() => _SendPassState();
}

class _SendPassState extends State<SendPass> {
  bool _hover1 = false;
  bool _hover2 = false;
  bool _sent = false;

  Future<void> _sendpass() async {
    try {
      final response = await post(
        Uri.parse('$baseurl/send-password'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': await getUsername()}),
      );
      status = response.statusCode;
    } catch (e) {
      status = 500;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("send password"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
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
            AnimatedContainer(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(5)),
              child: _sent
                  ? Text(
                      "An email has been sent to your registered mail ID",
                      style: TextStyle(),
                    )
                  : Text(
                      "An email will be sent to your registered mail ID",
                      style: TextStyle(),
                    ),
            ),
            MouseRegion(
              onEnter: (_) => {
                setState(() {
                  _hover1 = !_hover1;
                })
              },
              onExit: (_) => {
                setState(() {
                  _hover1 = !_hover1;
                })
              },
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async => {
                  await _sendpass(),
                  setState(() {
                    if (status == 200) {
                      if (context.mounted) {
                        showDialog(
                          animationStyle: AnimationStyle(
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 300),
                            reverseCurve: Curves.easeInOut,
                            reverseDuration: Duration(milliseconds: 300),
                          ),
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(secondary),
                              content: Text(
                                "Mail sent",
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
                      _sent = true;
                      status = 0;
                    } else {
                      if (context.mounted) {
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
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  })
                },
                child: SizedBox(
                  width: 150,
                  child: AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: _hover1 ? Color(secondary) : Color(primary),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 300),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _hover1 ? Color(primary) : Color(secondary),
                      ),
                      child: _sent
                          ? Text('Resend password')
                          : Text('Send password'),
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              onEnter: (_) => {
                setState(() {
                  _hover2 = !_hover2;
                })
              },
              onExit: (_) => {
                setState(() {
                  _hover2 = !_hover2;
                })
              },
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  )
                },
                child: SizedBox(
                  width: 150,
                  child: AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: _hover2 ? Color(secondary) : Color(primary),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 300),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _hover2 ? Color(primary) : Color(secondary),
                      ),
                      child: Text('Go to login'),
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
