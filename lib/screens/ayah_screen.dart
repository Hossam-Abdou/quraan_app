import 'package:animated_switch/animated_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class AyahScreen extends StatefulWidget {
  final int surahIndex; // Add this line

  AyahScreen({required this.surahIndex});

  @override
  State<AyahScreen> createState() => _AyahScreenState();
}

class _AyahScreenState extends State<AyahScreen> {
  @override
  void initState() {
    super.initState();
    SystemCubit.get(context).loadQuraan(context,SystemCubit.get(context).surahModel!.data![widget.surahIndex].number);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SystemCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body:cubit.quraanList==null || cubit.quraanList.isEmpty ? Scaffold(
          body: Center(
          child: SimpleCircularProgressBar(
            progressColors:  [Colors.deepOrange],
            fullProgressColor: Colors.deepOrangeAccent,
            mergeMode: true,
            size: 25,
          ),
          ),
          ): Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),

              child: SingleChildScrollView(

                child: SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('images/a.png',height: 130),
                          Center(child: Text('${cubit.quraanList[widget.surahIndex].name}',style: TextStyle(fontSize: 30),)),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Row(

                                  children:[
                                    Expanded(child: Text('${cubit.quraanList[widget.surahIndex].ar}',style: TextStyle(height: 1.4,fontSize: 18,fontWeight: FontWeight.w800)),),
                                  ],
                                ),
                              ),
                          itemCount:  1
                      ),
                    ],
                  ),
                ),
              )
            ),
          );
        },
      );
  }
}
