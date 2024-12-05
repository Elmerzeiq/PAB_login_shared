import 'package:flutter/material.dart';
import 'package:flutter_login/screens/home_screen.dart';
import 'package:flutter_login/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MainApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen()
      },
    );
  }
}
