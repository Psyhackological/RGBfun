import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'color_adapter.dart';
import 'favorites_model.dart';
import 'home_page.dart';
import 'favorites_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ColorAdapter());
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return HomePage(
          color: _currentColor,
          onTap: _updateColor,
        );
      case 1:
        return const FavoritesPage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateSystemUIOverlay();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RGB fun',
          style: TextStyle(
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
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
