import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quraan_app_test/screens/main_screens/home_screen.dart';
import '../blocs/system_cubit.dart';
import '../screens/authenticate/login_screen.dart';
import '../screens/main_screens/azkar_screen.dart';
import '../screens/authenticate/authenticate_screen.dart';
import '../screens/authenticate/splash_screen.dart';

class AppRoot extends StatelessWidget {
  final Widget startWidget;

  AppRoot({required this.startWidget});

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>SystemCubit()
          ..getAllSurah()
            ..loadAzkar(context)

        ),
      ],

      child: ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:SplashScreen()
        );}
      ),
    );


  }
}
