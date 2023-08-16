import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

class Salah extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit=SystemCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading:Icon(Icons.menu_rounded,color: Color(0xfffa7031),) ,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search,color: Color(0xfffa7031),),
          )

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('images/header.png')),
                  Text('hello ',style: TextStyle(color: Colors.white),),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white24,
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('4 :30 am',style: TextStyle(fontSize: 20),),
                      Text('الفجر',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,),),
                    ],
                  ),
                ),
              ),  
              SizedBox(height: 15,),

              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white24,
                ),
              ),              SizedBox(height: 15,),

              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white24,
                ),
              ),              SizedBox(height: 15,),

              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white24,
                ),
              ),              SizedBox(height: 15,),

              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white24,
                ),
              ),

            ],

          ),
        ),
      ),
    );
  },
);
  }
}
