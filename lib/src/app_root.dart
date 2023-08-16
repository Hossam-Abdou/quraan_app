import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/screens/quraan_screen.dart';

import '../blocs/system_cubit.dart';
import '../screens/azkar_screen.dart';
import '../screens/login_screen.dart';
import '../screens/mwaayd_elsalah_screen.dart';
import '../screens/new.dart';
import '../screens/splash_screen.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>SystemCubit()..getAllSurah()..getAllSalah())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home:Salah()
      ),
    );


  }
}
