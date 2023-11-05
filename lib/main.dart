import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quraan_app_test/screens/view/authenticate/authenticate_screen.dart';
import 'package:quraan_app_test/screens/view/main_screens/home_screen.dart';
import 'package:quraan_app_test/service/sp_helper/sp_helper.dart';
import 'blocs/bloc_observer.dart';
import 'firebase_options.dart';
import 'src/app_root.dart';

main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefrenceHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget? widget;
  if(SharedPrefrenceHelper.getData(key: 'UserId')!=null){
    widget=HomeScreen();
  }else{
    widget=AuthenticateScreen();
  }

  runApp(
      AppRoot(startWidget: widget)
  );
}