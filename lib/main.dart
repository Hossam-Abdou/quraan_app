import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quraan_app_test/service/dio_helper/dio_helper.dart';
import 'package:quraan_app_test/service/sp_helper/sp_helper.dart';

import 'bloc_observer.dart';
import 'src/app_root.dart';

main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefrenceHelper.init();

  Bloc.observer = MyBlocObserver();


  runApp(
      AppRoot()
  );
}