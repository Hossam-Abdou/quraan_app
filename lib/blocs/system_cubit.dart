import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';
import 'package:quraan_app_test/model/pray_model.dart';
import 'package:quraan_app_test/model/surah_model_screen.dart';
import 'package:quraan_app_test/screens/main_screens/azkar_screen.dart';
import 'package:quraan_app_test/service/sp_helper/sp_helper.dart';
import '../model/azkar_details_model.dart';
import '../model/quraan_model.dart';
import '../model/azkar_model.dart';
import '../screens/main_screens/Favorite_screen.dart';
import '../screens/main_screens/compass_screen.dart';
import '../screens/main_screens/pray_time_screen.dart';
import '../screens/main_screens/quraan_screen.dart';
import '../service/dio_helper/dio_helper.dart';
part 'system_state.dart';

class SystemCubit extends Cubit<SystemState> {
  SystemCubit() : super(SystemInitial());

  static SystemCubit get(context) => BlocProvider.of(context);


  var formKey=GlobalKey<FormState>();
  int buttonIndex = 0;
  String? token;
  bool isShown=false;
  int bottomBarIndex = 1;

  List<AzkarModel> azkarList = [];
  List<AzkarDetailsModel> azkarDetailsList = [];
  List<QuraanModel> quraanList = [];



  SurahModel? surahModel;
  PrayModel? prayModel;
  Array? array;

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  TextEditingController userNameController=TextEditingController();


  final items =  [
    Icon(Icons.home, size: 20,color: Colors.white,),
    SvgPicture.asset(
      'images/Heart.svg',
      width: 20,
      height: 20,
      color: Colors.white,
    ),
    SvgPicture.asset(
      'images/quran.svg',
      width: 20,
      height: 20,
      color: Colors.white,
    ),
    SvgPicture.asset(
      'images/compass.svg',
      width: 20,
      height: 20,
      color: Colors.white,
    ),
    Icon(Icons.waving_hand, size: 20,color: Colors.white,),

  ];

  void switchButton(int index) {

      buttonIndex = index;
      emit(Systemindex());
  }

  void bottomIndex(int index) {

    bottomBarIndex = index;
    emit(Bottom());
  }

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


  clearController() {
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
      SharedPrefrenceHelper.saveData(key: 'UserId', value: value.user!.uid);
      emit(ChatLoginSuccess(token: value.user!.uid));
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
      SharedPrefrenceHelper.saveData(key: 'UserId', value: value.user!.uid);
      emit(ChatRegisterSuccess());
    }).catchError((error) {
      emit(ChatRegisterError(error: error.toString()));
    });

  }

  loadAzkar(BuildContext context) async {
     DefaultAssetBundle.of(context)
        .loadString("assets/database/azkar.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((value) {
        AzkarModel azkarModel = AzkarModel.fromJson(value);
        azkarList.add(azkarModel);
      });
    }).catchError((error) {
      print(error);
    });
  }

  loadQuraan(BuildContext context,number) async {
     DefaultAssetBundle.of(context)
        .loadString("assets/database/quraan.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((value) {
        QuraanModel qb = QuraanModel.fromJson(value);
        quraanList.add(qb);
        emit(dataReaded());
      });
    }).catchError((error) {
      print(error);
    });
  }
  List<AzkarDetailsModel> sectionDetails = [];

  loadSectionDetail(BuildContext context,id ) async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/azkar_details.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkarDetailsModel sectionDetail = AzkarDetailsModel.fromJson(section);
        emit(dataReaded());
        if(sectionDetail.sectionId == id) {
          sectionDetails.add(sectionDetail);
        }

      });

    }).catchError((error) {
      print(error);
    });
  }








  }





