import 'package:flutter/material.dart';
import 'color_display.dart';

class HomePage extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const HomePage({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorDisplay(
      color: color,
      onTap: onTap,
    );
  }
}
