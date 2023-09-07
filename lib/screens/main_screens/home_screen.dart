import 'package:animated_switch/animated_switch.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';
import 'package:quraan_app_test/service/sp_helper/sp_helper.dart';

import '../authenticate/authenticate_screen.dart';

class HomeScreen extends StatelessWidget {
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
               color: Colors.black54,
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
                          onTap:()
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
                    child: Text('مساعدة',style: TextStyle(color: Colors.white,fontSize: 15),textDirection: TextDirection.rtl,),
                    value: 'option2',
                  ),
                  PopupMenuItem(
                    child: Text('عنا',style: TextStyle(color: Colors.white,fontSize: 15),textDirection: TextDirection.rtl,),
                    value: 'option2',
                  ),
                   PopupMenuItem(
                       child:TextButton(
                           onPressed: ()
                           {
                             SharedPrefrenceHelper.removeData(key: 'UserId');
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthenticateScreen(),));
                           },
                           child: Text('Sign Out',style: TextStyle(color: Colors.deepOrange),))

                   )
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
          bottomNavigationBar: CurvedNavigationBar(
            items: cubit.items,
            index: cubit.bottomBarIndex,
            animationCurve: Curves.easeOutCirc,
            onTap: (index) {
              cubit.bottomIndex(index);
            },
            height: 47,
            backgroundColor: Colors.transparent,
            animationDuration: const Duration(milliseconds: 300),
            color: Colors.deepOrange,

            // animationCurve: ,
          ),
          body: cubit.screens[cubit.bottomBarIndex],
        );
      },
    );
  }
}
