import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

import '../../components/praytime_screen.dart';


class Salah extends StatefulWidget {

  @override
  State<Salah> createState() => _SalahState();
}

class _SalahState extends State<Salah> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit=SystemCubit.get(context);
    SystemCubit.get(context).getPrayTime();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(image: AssetImage('images/header.png'))),
                    Positioned(
                      top: 18,
                      right: 10,
                      child: Column(
                        children: [
                          Text('data',style: TextStyle(color: Colors.white),),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                            child:
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('data',style: TextStyle(color: Colors.white),),
                              Container(color: Colors.white,width: 2,height: 45,),
                              Text('data',style: TextStyle(color: Colors.white),),
                            ],
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 23,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xfff24f2b),
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('باقي علي اذان المغرب ',style: TextStyle(color: Colors.white,fontSize: 20,),),
                        Text('1 : 30 : 20',style: TextStyle(color: Colors.white,fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                PrayTime(name:'الفجر' ,time:'${cubit.prayModel!.data!.timings!.fajr}' ),
                PrayTime(name:'الظهر' ,time:'${cubit.prayModel!.data!.timings!.dhuhr}' ),
                PrayTime(name:'العصر' ,time:'${cubit.prayModel!.data!.timings!.asr}' ),
                PrayTime(name:'المغرب' ,time:'${cubit.prayModel!.data!.timings!.maghrib}' ),
                PrayTime(name:'العشاء' ,time:'${cubit.prayModel!.data!.timings!.isha}' ),
              ],

            ),
          ),
        ),
      ),
    );
  },
);
  }
}
