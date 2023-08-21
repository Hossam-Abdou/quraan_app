import 'package:animated_switch/animated_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

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
    SystemCubit.get(context).getAllAyah(SystemCubit.get(context).surahModel!.data![widget.surahIndex].number);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SystemCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 40,
              elevation: 0.0,
              leading:
              PopupMenuButton(
                color: Colors.black,
                icon:const Icon(
                  Icons.menu_rounded,
                  color: Color(0xfffa7031),
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Dark Mode',style: TextStyle(color: Colors.white,fontSize: 15),),
                          AnimatedSwitch(
                            value: cubit.isShown,
                            onChanged: (value)
                            {
                              cubit.changeShownForm();
                            },
                            iconOff: Icons.lock_open,
                            iconOn: Icons.lock,
                            textOn: 'On',
                            textOff: 'Off',
                            textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),
                            colorOn: Colors.deepOrange,
                            colorOff: Colors.grey,
                          )

                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Text('الاعدادات',style: TextStyle(color: Colors.white,fontSize: 15),textDirection: TextDirection.rtl,),
                      value: 'option2',
                    ),
                    PopupMenuItem(
                      child: Text('الاعدادات',style: TextStyle(color: Colors.white,fontSize: 15),textDirection: TextDirection.rtl,),
                      value: 'option2',
                    ),
                    PopupMenuItem(
                      child: Text('مساعدة',style: TextStyle(color: Colors.white,fontSize: 15),textDirection: TextDirection.rtl,),
                      value: 'option2',
                    ),
                    PopupMenuItem(
                      child: Text('عنا',style: TextStyle(color: Colors.white,fontSize: 15),textDirection: TextDirection.rtl,),
                      value: 'option2',
                    ),
                    // Add more menu items as needed
                  ];},),


              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.search,
                    color: Color(0xfffa7031),
                  ),
                )
              ],
            ),

            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                  itemBuilder: (context, index) =>
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children:[
               Expanded(child: Text('${cubit.ayahs!.data!.ayahs![index].text}')),
               Text(' \ufd3F${cubit.ayahs!.data!.ayahs![index].numberInSurah}\ufd3E'),
                          ],
                        ),
                      ),
                  itemCount: cubit.ayahs?.data?.ayahs?.length ??0
              ),
            ),
          );
        },
      );
  }
}
