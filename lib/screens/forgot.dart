import '/barrel1.dart';

class Forgot1 extends StatefulWidget {
  const Forgot1({super.key});
  @override
  _Forgot1State createState() => _Forgot1State();
}

class _Forgot1State extends State<Forgot1> {
  bool _hover2 = false;
  final TextEditingController text1 = TextEditingController();
  @override
  void dispose() {
    text1.dispose();
    super.dispose();
  }

  Future<void> _press2(String username) async {
    try {
      setclearusername(username);
      final response = await post(
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
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("forgot password"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            checknclear();
            Navigator.pop(context); // Goes back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter the registered username",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 300,
              child: AnimatedContainer(
                padding: EdgeInsets.only(bottom: 5, top: 10),
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
              width: 150,

              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: _hover2 ? Colors.grey : Colors.black,
                  border: Border.all(
                    color: _hover2 ? Colors.black : Colors.grey,
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
                            builder: (context) => const Verification(),
                          ),
                        );
                      }
                    } else if (status == 300) {
                      if (context.mounted) {
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
                    } else {
                      if (context.mounted) {
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
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _hover2 ? Colors.black : Colors.grey,
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
