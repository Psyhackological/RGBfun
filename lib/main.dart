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
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentColor = _generateRandomColor();
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _updateColor() {
    setState(() {
      _currentColor = _generateRandomColor();
      _updateSystemUIOverlay();
    });
  }

  void _updateSystemUIOverlay() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: _currentColor,
    ));
  }

  String _colorToHexString(Color color) {
    return '#${color.red.toRadixString(16).padLeft(2, '0').toUpperCase()}${color.green.toRadixString(16).padLeft(2, '0').toUpperCase()}${color.blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: _currentColor,
            width: double.infinity,
            height: double.infinity,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _updateColor,
              splashColor: Colors.white.withOpacity(0.25),
              child: Center(
                child: Text(
                  _colorToHexString(_currentColor),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courier',
                    letterSpacing: 0.5,
                    color: _currentColor.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(); // Empty container for the Favorites page
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateSystemUIOverlay();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            letterSpacing: 2,
            fontFamily: 'Courier',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
