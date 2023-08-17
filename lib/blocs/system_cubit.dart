import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quraan_app_test/model/newmode.dart';
import 'package:quraan_app_test/model/salah_model.dart';
import 'package:quraan_app_test/model/surah_model_screen.dart';
import 'package:quraan_app_test/screens/main_screens/azkar_screen.dart';
import '../model/azkar_model.dart';
import '../screens/main_screens/Favorite_screen.dart';
import '../screens/main_screens/compass_screen.dart';
import '../screens/main_screens/mwaayd_elsalah_screen.dart';
import '../screens/main_screens/quraan_screen.dart';
import '../service/dio_helper/dio_helper.dart';
part 'system_state.dart';

class SystemCubit extends Cubit<SystemState> {
  SystemCubit() : super(SystemInitial());

  static SystemCubit get(context) => BlocProvider.of(context);

  int buttonIndex = 0;

  final items = const [
    Icon(Icons.home, size: 20,color: Colors.white,),
    Icon(Icons.favorite, size: 20,color: Colors.white,),
    Icon(Icons.menu_book_outlined,size: 20,color: Colors.white,),
    Icon(Icons.compass_calibration_outlined, size: 20,color: Colors.white,),
    Icon(Icons.waving_hand_rounded, size: 20,color: Colors.white,),
  ];

  int bottomBarIndex = 1;
  void switchButton(int index) {

      buttonIndex = index;
      emit(Systemindex());
  }

  void bottomIndex(int index) {

    bottomBarIndex = index;
    emit(Bottom());
  }

  List<Widget>screens=[
    Salah(),
    FavoriteScreen(),
    QuraanScreen(),
    CompassScreen(),
    AzkarScreen()
  ];
  SurahModel? surahModel;
  AyahModel? ayahs;
  PrayModel? prayModel;

  Future<void> getAllSurah() async {
    await DioHelper.init(
      BaseOptions(
        baseUrl: 'https://api.alquran.cloud/',
        receiveDataWhenStatusError: true,
      ),
    );
    await DioHelper.getData(
      url: 'v1/surah',
    ).then(
          (value) {
        ayahs = AyahModel.fromJson(value.data);
        emit(GetSurahSuccess());
      },
    ).catchError(
          (error) {
        print(error);
        emit(GetSurahError(error.toString()));
      },
    );
  }

  Future<void> getPrayTime() async {
    await DioHelper.init(
      BaseOptions(
        baseUrl: 'https://api.aladhan.com/v1/',
        receiveDataWhenStatusError: true,
      ),
    );

    await DioHelper.getData(
      url: 'timingsByCity/17-08-2023',
      query: {
        'city':'cairo',
        'country':'egypt',
        'method':'8'
      }
    ).then(
          (value) {
        prayModel = PrayModel.fromJson(value.data);
        emit(GetSalahSuccess());
      },
    ).catchError(
          (error) {
        print(error);
        emit(GetSalahError(error.toString()));
      },
    );
  }

  AzkarModel? azkarModel;
  Future<void> getAllAzkar() async {
    await DioHelper.init(
      BaseOptions(
        baseUrl: 'https://raw.githubusercontent.com/',
        receiveDataWhenStatusError: true,
      ),
    );
    await DioHelper.getData(
      url: 'nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json',
    ).then(
          (value) {
            azkarModel = AzkarModel.fromJson(value.data);
            print(azkarModel!.b![0].description);
        emit(GetAzkarSuccess());
      },
    ).catchError(
          (error) {
        print(error);
        emit(GetAzkarError(error.toString()));
      },
    );
  }

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  TextEditingController userNameController=TextEditingController();

  Login()async {
    emit(ChatLoginloading());
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:emailController.text,
      password:passwordController.text,
    ).then((value) {
      emit(ChatLoginSuccess());
    }).catchError((error) {
      emit(ChatLoginError(error: error.toString()));
    });
  }


  Register()async {
    emit(ChatRegisterloading());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:emailController.text,
      password:passwordController.text,
    ).then((value) {
      emit(ChatRegisterSuccess());
    }).catchError((error) {
      emit(ChatRegisterError(error: error.toString()));
    });

  }


}
