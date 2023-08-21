import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

import '../../components/praytime_screen.dart';
import '../../model/section_model.dart';

class AzkarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
    listener: (context, state) {},
    builder: (context, state) {
      var cubit = SystemCubit.get(context);
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('الادعية و الاذكار',style: TextStyle(color: Color(0xfffa7031),fontSize: 40,fontWeight: FontWeight.w900),),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),

                  shrinkWrap: true,
                  itemCount: cubit.sections.length,
                  itemBuilder: (context, index)
                  {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        children: [
                          Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white24,
                            ),
                            child:Center(child: Text('${cubit.sections[index].name}',style: TextStyle(fontSize: 20),)),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ) ;
                    },
                    separatorBuilder: (context, index) =>SizedBox(height: 15,) ,
                )
              ],
            ),
          ),
        ),
      );
    },
);
  }
}


