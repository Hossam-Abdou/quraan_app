import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quraan_app_test/model/newmode.dart';
import 'package:quraan_app_test/model/salah_model.dart';
import 'package:quraan_app_test/model/surah_model_screen.dart';
import 'package:quraan_app_test/screens/mwaayd_elsalah_screen.dart';

import '../service/dio_helper/dio_helper.dart';
part 'system_state.dart';

class SystemCubit extends Cubit<SystemState> {
  SystemCubit() : super(SystemInitial());

  static SystemCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void switchButton(int index) {

      currentIndex = index;
      emit(Systemindex());
  }
  SurahModel? surahModel;
  AyahModel? ayahs;

  Future<void> getAllSurah() async {
    await DioHelper.init(
      BaseOptions(
        baseUrl: 'https://api.alquran.cloud/', // First base URL
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

SalahModel? salahModel;
  Future<void> getAllSalah() async {
    await DioHelper.init(
      BaseOptions(
        baseUrl: 'https://api.aladhan.com/', // First base URL
        receiveDataWhenStatusError: true,
      ),
    );

    await DioHelper.getData(
      url: 'v1/timingsByCity/16-08-2023',
      query: {
        'city':'cairo',
        'country':'egypt',
        'method':'8'
      }
    ).then(
          (value) {
        salahModel = SalahModel.fromJson(value.data);
        emit(GetSurahSuccess());
      },
    ).catchError(
          (error) {
        print(error);
        emit(GetSurahError(error.toString()));
      },
    );
  }




}
