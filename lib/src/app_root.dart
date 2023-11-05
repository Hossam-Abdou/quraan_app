import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/view/main_screens/home_screen.dart';
import '../screens/view_model/system_cubit.dart';

class AppRoot extends StatelessWidget {
  final Widget startWidget;

  const AppRoot({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SystemCubit()..loadAzkar(context)),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: HomeScreen());
          }),
    );
  }
}
