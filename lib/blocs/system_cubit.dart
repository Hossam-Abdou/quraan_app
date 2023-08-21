import 'dart:convert';
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
import '../model/asd.dart';
import '../model/section_model.dart';
import '../screens/main_screens/Favorite_screen.dart';
import '../screens/main_screens/compass_screen.dart';
import '../screens/main_screens/mwaayd_elsalah_screen.dart';
import '../screens/main_screens/quraan_screen.dart';
import '../service/dio_helper/dio_helper.dart';
part 'system_state.dart';

class SystemCubit extends Cubit<SystemState> {
  SystemCubit() : super(SystemInitial());

  static SystemCubit get(context) => BlocProvider.of(context);
  var formKey=GlobalKey<FormState>();

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
  bool isShown=false;

   changeShownForm(){
    isShown=!isShown;
    emit(ChangeShownFormSuccessState());
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
        surahModel = SurahModel.fromJson(value.data);
        emit(GetSurahSuccess());
      },
    ).catchError(
          (error) {
        print(error);
        emit(GetSurahError(error.toString()));
      },
    );
  }

  Future<void> getAllAyah( number) async {
    await DioHelper.init(
      BaseOptions(
        baseUrl: 'https://api.alquran.cloud/',
        receiveDataWhenStatusError: true,
      ),
    );
    await DioHelper.getData(
      url: 'v1/surah/$number',
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

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
clearController()
{
  emailController .clear();
  passwordController.clear();
  confirmPasswordController.clear();
  userNameController.clear();
}
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
  List<SectionModel> sections = [];
  loadSections(BuildContext context) async {
     DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((value) {
        SectionModel section = SectionModel.fromJson(value);
        sections.add(section);
      });
    }).catchError((error) {
      print(error);
    });
  }





  }





