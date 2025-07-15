import '/barrel1.dart';

class Theme1 extends StatefulWidget {
  const Theme1({super.key});
  @override
  _Theme1State createState() => _Theme1State();
}

class _Theme1State extends State<Theme1> {
  bool _saveButtonHover1 = false;

  Color picker1 = Color(primary);
  Color picker2 = Color(secondary);
  Color picker3 = Color(accent);

  Color current1 = Color(primary);
  Color current2 = Color(secondary);
  Color current3 = Color(accent);

  @override
  void dispose() {
    super.dispose();
  }

  void changeColor1(Color color) {
    setState(() => picker1 = color);
  }

  void changeColor2(Color color) {
    setState(() => picker2 = color);
  }

  void changeColor3(Color color) {
    setState(() => picker3 = color);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 50,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: picker1,
                          onColorChanged: changeColor1,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Set'),
                          onPressed: () {
                            setState(() => current1 = picker1);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: AnimatedContainer(
                padding: EdgeInsets.symmetric(vertical: 10),
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: current1, border: Border.all(color: Colors.white)),
                child: Text(
                  'primary color ',
                  style: TextStyle(
                    color: invertColor(picker1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: picker2,
                          onColorChanged: changeColor2,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Set'),
                          onPressed: () {
                            setState(() => current2 = picker2);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: current2, border: Border.all(color: Colors.white)),
                child: Text(
                  'secondary color',
                  style: TextStyle(
                    color: invertColor(picker2),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: picker3,
                          onColorChanged: changeColor3,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Set'),
                          onPressed: () {
                            setState(() => current3 = picker3);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: current3, border: Border.all(color: Colors.white)),
                child: Text(
                  'accent color ',
                  style: TextStyle(
                    color: invertColor(picker3),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: () async {
                await setcolors(colorToInt(picker1), colorToInt(picker2),
                    colorToInt(picker3));
                setState(() {});
              },
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _saveButtonHover1 = !_saveButtonHover1;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _saveButtonHover1 = !_saveButtonHover1;
                  });
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          _saveButtonHover1 ? Color(secondary) : Color(primary),
                      border: Border.all()),
                  duration: Duration(milliseconds: 300),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 300),
                    style: TextStyle(
                        color: _saveButtonHover1
                            ? Color(primary)
                            : Color(secondary)),
                    child: Text(
                      'Save',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
