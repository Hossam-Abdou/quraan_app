import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quraan_app_test/service/sp_helper/sp_helper.dart';

import 'bloc_observer.dart';
import 'firebase_options.dart';
import 'src/app_root.dart';

main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefrenceHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      AppRoot()
  );
}