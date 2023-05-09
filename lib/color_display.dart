import 'package:flutter/material.dart';

class ColorDisplay extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const ColorDisplay({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  String _colorToHexString(Color color) {
    return '#${color.red.toRadixString(16).padLeft(2, '0').toUpperCase()}${color.green.toRadixString(16).padLeft(2, '0').toUpperCase()}${color.blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: color,
          width: double.infinity,
          height: double.infinity,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.white.withOpacity(0.25),
            child: Center(
              child: Text(
                _colorToHexString(color),
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courier',
                  letterSpacing: 0.5,
                  color: color.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
