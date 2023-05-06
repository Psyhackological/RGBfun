import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGB fun',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'RGB fun'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = generateRandomColor();
  }

  Color generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  void _generateRandomColor() {
    setState(() {
      _currentColor = generateRandomColor();
    });
  }

  String _colorToHexString(Color color) {
    return '#${color.red.toRadixString(16).padLeft(2, '0').toUpperCase()}${color.green.toRadixString(16).padLeft(2, '0').toUpperCase()}${color.blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: _currentColor,
      statusBarIconBrightness: _currentColor.computeLuminance() > 0.5
          ? Brightness.dark
          : Brightness.light,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 330),
            color: _currentColor,
            width: double.infinity,
            height: double.infinity,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _generateRandomColor,
              splashColor: Colors.white.withOpacity(0.25),
              child: Center(
                child: Text(
                  _colorToHexString(_currentColor),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: _currentColor.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
