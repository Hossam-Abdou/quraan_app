import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

import '../../components/praytime_screen.dart';
import '../../model/azkar_model.dart';
import '../azkar_details_screen.dart';

class AzkarScreen extends StatefulWidget {

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
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
                  separatorBuilder: (context, index) =>SizedBox(height: 15,),
                  itemCount: cubit.azkarList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index)
                  {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child:
                          InkWell(
                            onTap: ()
                            {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  SectionDetailScreen(
                                    id: cubit.azkarList[index].id!,
                                title: '${cubit.azkarList[index].name}',)
                              )
                              );
                            },
                            child: Container(
                              height: 65,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white24,
                              ),
                              child:Center(child: Text('${cubit.azkarList[index].name}',style: TextStyle(fontSize: 20),)),
                            ),
                          ),
                    ) ;
                    },
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


