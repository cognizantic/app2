import 'dart:ui' as ui;

import '/barrel1.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool _checkrem = false;
  bool _pass1 = false;
  late AnimationController _dashController;
  // ignore: unused_field
  late TickerProviderStateMixin _tickerProvider;
  double _dashOffset = 0.0;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey _modalKey = GlobalKey();
  String _randomWelcome() {
    final random = Random();
    return greetings[random.nextInt(greetings.length)];
  }

  late String _welcomeMessage = _randomWelcome();
  Rect _getModalRect() {
    final renderBox =
        _modalKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final position = renderBox.localToGlobal(Offset.zero);
      return position & renderBox.size;
    }
    return Rect.zero;
  }

  Future<int> _press1(String username, String passcode) async {
    try {
      final response = await post(
        Uri.parse('$baseurl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': passcode}),
      );
      status = response.statusCode;
      return status;
    } catch (e) {
      status = 500;
      return status;
    }
  }

  late Color _textColor = Theme.of(context).colorScheme.onSurface;
  Offset? _cursorPosition = Offset.zero;
  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();
  // ignore: prefer_final_fields
  List<Offset> _pins = [];
  @override
  void initState() {
    super.initState();
    _dashController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {
          _dashOffset += 1;
        });
      });
    _dashController.repeat();
  }

  @override
  void dispose() {
    _dashController.dispose();
    text1.dispose();
    text2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final modalRect = _getModalRect();
      setState(() {
        _pins.removeWhere((pin) => modalRect.contains(pin));
      });
    });

    return Scaffold(
      //,
      body: MouseRegion(
        onHover: (PointerHoverEvent event1) {
          setState(() {
            _cursorPosition = event1.localPosition;
          });
        },
        child: GestureDetector(
          onTapDown: (details) {
            final localPos = details.localPosition;

            // Prevent pin on modal
            final modalBox =
                _modalKey.currentContext?.findRenderObject() as RenderBox?;
            if (modalBox != null) {
              final modalOffset = modalBox.localToGlobal(Offset.zero);
              final modalRect = modalOffset & modalBox.size;
              if (modalRect.contains(details.globalPosition)) return;
            }

            setState(() {
              // Remove if tap is on existing pin
              final tappedPinIndex =
                  _pins.indexWhere((pin) => (pin - localPos).distance < 30);
              if (tappedPinIndex != -1) {
                _pins.removeAt(tappedPinIndex);
              } else {
                _pins.add(localPos);
              }
            });
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/login_back2.jpg',
                  fit: BoxFit.fill, // cover the full screen
                ),
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: SpotlightPainter(
                    context,
                    _cursorPosition ?? Offset.zero,
                    100,
                    _getModalRect(),
                  ),
                  child: const SizedBox.expand(),
                ),
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: DashedLinePainter(
                    points: _pins,
                    color: Theme.of(context).colorScheme.onPrimary,
                    dashOffset: _dashOffset,
                  ),
                ),
              ),
              Center(
                child: FittedBox(
                  child: Form(
                    child: SizedBox(
                      key: _modalKey,
                      width: 300,
                      height: 400,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _welcomeMessage = _randomWelcome();
                                  });
                                },
                                child: MouseRegion(
                                  onEnter: (event) {
                                    setState(() {
                                      _textColor = Theme.of(context)
                                          .colorScheme
                                          .onPrimary;
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      _textColor = Theme.of(context)
                                          .colorScheme
                                          .onSurface;
                                    });
                                  },
                                  child: Text(
                                    _welcomeMessage,
                                    style: GoogleFonts.lobster(
                                      textStyle: TextStyle(
                                        fontSize: 32,
                                        fontStyle: FontStyle.italic,
                                        color: _textColor,
                                      ),
                                    ),
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
                                textAlign: TextAlign.center,
                                controller: text1,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'username',
                                    suffixIcon: Icon(Icons.account_box)),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                obscuringCharacter: "|",
                                obscureText: _pass1 ? false : true,
                                controller: text2,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        _pass1
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
                                Text(
                                  "Remember me",
                                  //style: TextStyle(),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState?.validate() ??
                                            true) {
                                          if (await _press1(
                                                  text1.text, text2.text) ==
                                              500) {
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
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          } else {
                                            if (status == 200) {
                                              if (_checkrem) {
                                                saveUsername(text1.text);
                                              } else {
                                                setclearusername(text1.text);
                                              }
                                              if (context.mounted) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Signin(),
                                                  ),
                                                );
                                              }
                                            } else if (status == 300 ||
                                                status == 301) {
                                              if (context.mounted) {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(
                                                        "check username/password",
                                                        style: TextStyle(),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child:
                                                              const Text('OK'),
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
                                                      content: Text(
                                                        "no username found",
                                                        style: TextStyle(),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child:
                                                              const Text('OK'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            }
                                          }
                                        }
                                      },
                                      child: const Text("sign in"),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup(),
                                          ),
                                        );
                                      },
                                      child: const Text("sign up"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Forgot1()),
                                );
                              },
                              style: ButtonStyle(
                                  maximumSize:
                                      WidgetStatePropertyAll(Size(300, 50))),
                              child: const Text('forget password'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ..._pins.map(
                (pos) => Positioned(
                  left: pos.dx - 10,
                  top: pos.dy - 30,
                  child: _buildPin(pos.dx, pos.dy),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPin(double x, double y) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 4)],
          ),
          child: Column(
            children: [
              Icon(
                Icons.phonelink_sharp,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 20,
              ),
              Text(
                "X: ${x.toInt()}",
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                "Y: ${y.toInt()}",
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpotlightPainter extends CustomPainter {
  final BuildContext context;
  final Offset position;
  final double radius;
  final Rect modalRect;
  SpotlightPainter(this.context, this.position, this.radius, this.modalRect);
  @override
  void paint(Canvas canvas, Size size) {
    final darkPaint = Paint()..color = Theme.of(context).colorScheme.surface;
    final clearPaint = Paint()..blendMode = ui.BlendMode.clear;

    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), darkPaint);

    canvas.drawRect(modalRect, clearPaint);

    if (!modalRect.contains(position)) {
      final gradient = RadialGradient(
        center: Alignment.center,
        radius: 0.7,
        colors: [
          const ui.Color.fromARGB(245, 0, 0, 0),
          const ui.Color.fromARGB(237, 0, 0, 0),
          const ui.Color.fromARGB(204, 0, 0, 0),
          const ui.Color.fromARGB(162, 0, 0, 0),
          const ui.Color.fromARGB(131, 0, 0, 0),
          const ui.Color.fromARGB(83, 0, 0, 0),
          const ui.Color.fromARGB(43, 0, 0, 0),
          const ui.Color.fromARGB(21, 0, 0, 0),
          const ui.Color.fromARGB(1, 0, 0, 0),
          Colors.black,
        ],
        stops: [
          0.1,
          0.2,
          0.3,
          0.4,
          0.5,
          0.6,
          0.7,
          0.8,
          0.9,
          1.0,
        ],
      );

      final spotlightRect = Rect.fromCircle(center: position, radius: radius);
      final spotlightPaint = Paint()
        ..shader = gradient.createShader(spotlightRect)
        ..blendMode = ui.BlendMode.dstOut;

      canvas.drawCircle(position, radius, spotlightPaint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SpotlightPainter oldDelegate) {
    return oldDelegate.position != position ||
        oldDelegate.radius != radius ||
        oldDelegate.modalRect != modalRect ||
        oldDelegate.context != context;
  }
}

class DashedLinePainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final double dashLength;
  final double dashOffset;

  DashedLinePainter({
    required this.points,
    required this.color,
    required this.dashOffset,
    this.dashLength = 6.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];
      final totalDistance = (p2 - p1).distance;
      final diff = p2 - p1;
      final distance = diff.distance;
      final direction = distance == 0
          ? Offset.zero
          : Offset(diff.dx / distance, diff.dy / distance);
      double distanceCovered = dashOffset % (dashLength * 2);

      while (distanceCovered < totalDistance) {
        final currentStart = p1 + direction * distanceCovered;
        distanceCovered += dashLength;
        if (distanceCovered >= totalDistance) break;
        final currentEnd = p1 + direction * distanceCovered;
        canvas.drawLine(currentStart, currentEnd, paint);
        distanceCovered += dashLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedLinePainter oldDelegate) =>
      oldDelegate.points != points ||
      oldDelegate.color != color ||
      oldDelegate.dashOffset != dashOffset;
}
