import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin
{
  late final AnimationController _textFade;
  late final Animation<double> curves;

  @override
  initState(){
    super.initState();

    _textFade = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    curves = CurvedAnimation(
      parent: _textFade,
      curve: Curves.easeIn,
    );

    _textFade.forward();

    Future.delayed(const Duration(seconds: 4), (){
      Navigator.pushReplacementNamed(context, '/shuffle');
    });
  }

  @override
  void dispose(){
    super.dispose();

    _textFade.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff000020),
              Colors.black,
              Colors.black,
              Colors.black,
              Color(0xff000e0f),
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _textFade,
            child: const Text(
              'Travel App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}