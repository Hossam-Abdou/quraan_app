import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/system_cubit.dart';
import '../screens/main_screens/azkar_screen.dart';

import '../screens/authenticate/authenticate_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/test.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>SystemCubit()..getAllSurah()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home:SplashScreen()
      ),
    );


  }
}
