// Full Dart Code with Rain and Lightning Effects (Splatter Fixed Only When Hitting UI Boundary)

import 'dart:ui';

import '/barrel1.dart';

class Forgot1 extends StatefulWidget {
  const Forgot1({super.key});
  @override
  _Forgot1State createState() => _Forgot1State();
}

class _Forgot1State extends State<Forgot1> with SingleTickerProviderStateMixin {
  final TextEditingController text1 = TextEditingController();
  late AnimationController _controller;
  // ignore: prefer_final_fields
  List<Raindrop> _raindrops = [];
  // ignore: prefer_final_fields
  List<Splatter> _splatters = [];
  Size screenSize = const Size(400, 800);
  final GlobalKey _uiKey = GlobalKey();
  Rect uiRect = Rect.zero;
  final Random random = Random();
  // ignore: prefer_final_fields
  List<bool> _isSelected = [true, false];
  double _angle = pi / 9;
  double _intensity = 1.0;
  bool _lightningFlash = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenSize = MediaQuery.of(context).size;
      final renderBox = _uiKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final offset = renderBox.localToGlobal(Offset.zero);
        final size = renderBox.size;
        uiRect = offset & size;
      }

      for (int i = 0; i < 200; i++) {
        _raindrops.add(Raindrop(
          x: random.nextDouble() * screenSize.width - 100,
          y: random.nextDouble() * screenSize.height,
          length: random.nextDouble() * 20 + 10,
          speed: random.nextDouble() * 2 + 2,
          angle: _angle,
        ));
      }

      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 16),
      )
        ..addListener(updateScene)
        ..repeat();
    });
  }

  void updateScene() {
    setState(() {
      _angle += random.nextDouble() * 0.001 - 0.0005;
      _intensity += random.nextDouble() * 0.05 - 0.025;
      _intensity = _intensity.clamp(0.5, 1.5);

      _lightningFlash = random.nextDouble() < 0.002;

      for (var drop in _raindrops) {
        drop.angle = _angle;
        drop.x += drop.speed * sin(drop.angle) * _intensity;
        drop.y += drop.speed * cos(drop.angle) * _intensity;

        if (uiRect.top != 0 &&
            drop.y >= uiRect.top &&
            drop.y <= uiRect.bottom &&
            drop.x >= uiRect.left &&
            drop.x <= uiRect.right) {
          // Inside UI - no splatter
        } else if (drop.y >= uiRect.top &&
            drop.y <= uiRect.bottom &&
            drop.x >= uiRect.left - 5 &&
            drop.x <= uiRect.right + 5) {
          // Hitting the edge of the UI
          _splatters.add(Splatter(
            x: drop.x,
            y: drop.y,
            startTime: DateTime.now(),
          ));
        }

        if (drop.y > screenSize.height || drop.x > screenSize.width + 20) {
          drop.y = -10;
          drop.x = random.nextDouble() * screenSize.width - 100;
        }
      }

      _splatters.removeWhere(
          (s) => DateTime.now().difference(s.startTime).inMilliseconds > 300);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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

  Widget _verficationBar() {
    return Container();
  }

  Widget _centerForget() {
    return Container(
      key: _uiKey,
      height: 400,
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          color: Theme.of(context).colorScheme.surface),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              child: Text("Enter the registered username")),
          Container(
            padding: EdgeInsets.all(5),
            width: 300,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: text1,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                hintText: "username",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ToggleButtons(
              isSelected: _isSelected,
              renderBorder: false,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _isSelected.length; i++) {
                    _isSelected[i] = i == index;
                  }
                });
              },
              children: List.generate(_isSelected.length, (index) {
                final isActive = _isSelected[index];
                final bgGradient = LinearGradient(
                  colors: isActive
                      ? [
                          Theme.of(context).colorScheme.onPrimary,
                          Theme.of(context).colorScheme.surface
                        ]
                      : [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.surface
                        ],
                );
                final textGradient = LinearGradient(
                  colors: isActive
                      ? [Colors.black, Colors.black]
                      : [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.primary
                        ],
                );
                final label = index == 0 ? 'Send Password' : 'Change Password';
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(gradient: bgGradient),
                  child: ShaderMask(
                    shaderCallback: (bounds) => textGradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    blendMode: BlendMode.srcIn,
                    child: Text(label, style: const TextStyle(fontSize: 16)),
                  ),
                );
              }),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () async {
                await _press2(text1.text);
                if (status == 200 && context.mounted) {
                  Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Verification()));
                } else if (status == 300 && context.mounted) {
                  showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (context) => AlertDialog(
                      content: const Text("no username found"),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"))
                      ],
                    ),
                  );
                } else if (context.mounted) {
                  showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (context) => AlertDialog(
                      content: const Text("unexpected error"),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"))
                      ],
                    ),
                  );
                }
              },
              style: ButtonStyle(
                  maximumSize: WidgetStateProperty.all(const Size(300, 50))),
              child: const Text('forget password'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            checknclear();
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter:
                RainPainter(_raindrops, _splatters, _lightningFlash, context),
          ),
          Center(child: _centerForget()),
        ],
      ),
    );
  }
}

class Raindrop {
  double x, y, length, speed, angle;
  Raindrop(
      {required this.x,
      required this.y,
      required this.length,
      required this.speed,
      required this.angle});
}

class Splatter {
  double x, y;
  DateTime startTime;
  Splatter({required this.x, required this.y, required this.startTime});
}

class RainPainter extends CustomPainter {
  final BuildContext context;
  final List<Raindrop> raindrops;
  final List<Splatter> splatters;
  final bool flash;
  RainPainter(this.raindrops, this.splatters, this.flash, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    if (flash) {
      canvas.drawRect(
        Offset.zero & size,
        Paint()..color = Theme.of(context).colorScheme.onPrimary,
      );
    }

    final paint = Paint()
      ..color = Theme.of(context).colorScheme.onPrimary
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round;

    for (var drop in raindrops) {
      final dx = drop.length * sin(drop.angle);
      final dy = drop.length * cos(drop.angle);
      canvas.drawLine(
        Offset(drop.x, drop.y),
        Offset(drop.x + dx, drop.y + dy),
        paint,
      );
    }

    final splatterPaint = Paint()
      ..color = Theme.of(context).colorScheme.onPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (var s in splatters) {
      final age = DateTime.now().difference(s.startTime).inMilliseconds / 300.0;
      final radius = lerpDouble(0, 8, age)!;
      //final alpha = (1.0 - age).clamp(0.0, 1.0);
      splatterPaint.color = Theme.of(context).colorScheme.onPrimary;
      canvas.drawCircle(Offset(s.x, s.y), radius, splatterPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
