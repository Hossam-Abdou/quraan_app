import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('images/splash.png',width: double.infinity,height: double.infinity,),
        splashIconSize: double.infinity,
        nextScreen: ButtonSwitchScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
