import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'models/page_shuffle.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget{
  const TravelApp({super.key});


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/shuffle': (context) => const PageShuffle(),
      }
    );
  }
}