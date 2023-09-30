import 'package:flutter/material.dart';
import 'package:flutter_login/screen/select_language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> countdown() async {
    await Future.delayed(const Duration(
      milliseconds: 2000,
    ));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectLanguageScreen()),
    );
  }

  @override
  void initState() {
    countdown();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //Here you can set what ever background color you need.
      backgroundColor: Colors.purple,
    );
  }
}
