import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

//クラスインポート
import 'package:akindo/screens/first_page.dart';

class SplashScreen extends StatelessWidget{
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "images/logo.png",
      nextScreen: FirstPage(),
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Color.fromRGBO(198, 241, 232, 1)
    );
  }
}