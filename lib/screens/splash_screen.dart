import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'authenticate/authenticate_screen.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Scaffold(
        body:
           AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset('images/splash.png',width: double.infinity,),
            splashIconSize: double.infinity,
            nextScreen: AuthenticateScreen(),
            splashTransition: SplashTransition.fadeTransition,
          ),

      ),
    );
  }
}
