import 'package:anxeious/barrel1.dart';

// ignore: use_key_in_widget_constructors
class CustomToggleButtons extends StatefulWidget {
  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  // ignore: prefer_final_fields
  List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_isSelected.length, (index) {
        final isActive = _isSelected[index];

        // Background gradient logic
        final backgroundGradient = isActive
            ? const LinearGradient(
                colors: [Colors.teal, Colors.black],
                stops: [0.75, 1.0],
              )
            : const LinearGradient(
                colors: [Colors.black, Colors.black],
              );

        // Text gradient opposite to background
        final textGradient = isActive
            ? const LinearGradient(
                colors: [Colors.white, Colors.yellowAccent],
              )
            : const LinearGradient(
                colors: [Colors.tealAccent, Colors.greenAccent],
              );

        final label = index == 0 ? 'Send Password' : 'Change Password';

        return GestureDetector(
          onTap: () {
            setState(() {
              for (int i = 0; i < _isSelected.length; i++) {
                _isSelected[i] = i == index;
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              gradient: backgroundGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: child,
              ),
              child: ShaderMask(
                key: ValueKey<bool>(isActive), // force rebuild on toggle
                shaderCallback: (bounds) => textGradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                blendMode: BlendMode.srcIn,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
