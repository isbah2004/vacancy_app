import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vacancy_app/reusablewidgets/multicolor_progress_indicator.dart';
import 'package:vacancy_app/screens/homescreen/home_screen.dart';
import 'package:vacancy_app/utils/constants.dart';
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Constants.logo),
            ),
            MulticolorProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
