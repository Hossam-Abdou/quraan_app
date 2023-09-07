import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';
import 'package:quraan_app_test/model/surah_model_screen.dart';
import 'package:quraan_app_test/screens/ayah_screen.dart';

import '../quran_details_screens/parts_screen.dart';
import '../quran_details_screens/sheikh_screen.dart';
import '../quran_details_screens/surah_screen.dart';
class QuraanScreen extends StatelessWidget {
final SurahModel? surahModel;

QuraanScreen({this.surahModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SystemCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                'images/Layer2.png',
                height: 100,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(17)),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            cubit.switchButton(0);
                          },
                          child: Text(
                            'السور',
                            style: TextStyle(
                                color: cubit.buttonIndex == 0
                                    ? const Color(0xfff1482a)
                                    : Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 19),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 9.0),
                          child: VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.switchButton(1);
                          },
                          child: Text('الاجزاء',
                              style: TextStyle(
                                  color: cubit.buttonIndex == 1
                                      ? Color(0xfff1482a)
                                      : Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 19)),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 9.0),
                          child: VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.switchButton(2);
                          },
                          child: Text('الشيوخ',
                              style: TextStyle(
                                  color: cubit.buttonIndex == 2
                                      ? Color(0xfff1482a)
                                      : Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 19)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              cubit.buttonIndex == 0
                  ? SurahScreen() : cubit.buttonIndex == 1
                      ? PartsScreen()
                      : SheikhScreen(),
            ],
          ),
        );
      },
    );
  }
}
