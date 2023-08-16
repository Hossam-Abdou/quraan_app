import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';
import 'package:quraan_app_test/screens/register_screen.dart';

import 'login_utils.dart';

class ButtonSwitchScreen extends StatefulWidget {
  @override
  _ButtonSwitchScreenState createState() => _ButtonSwitchScreenState();
}

class _ButtonSwitchScreenState extends State<ButtonSwitchScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit=SystemCubit.get(context);
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset('images/Layer 1.png',height: 200,)),
                Container(
                  width:165 ,
                  decoration: BoxDecoration(
                    border:Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            cubit.switchButton(0);
                          },
                          child: Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                              border:cubit.currentIndex==0?  Border.all(width: 0,color: Colors.black):null,
                              borderRadius: BorderRadius.circular(cubit.currentIndex==0? 15:0),
                            ),
                            child: Center(
                              child: Text('Login',
                                style: TextStyle(
                                    color:cubit.currentIndex==0?Colors.orangeAccent:Colors.grey[300],
                                    fontWeight:FontWeight.w900,
                                    fontSize: 13
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cubit.switchButton(1);
                          },
                          child: Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                              border:cubit.currentIndex==1? Border.all(width: 0,color: Colors.black): null,
                              borderRadius: BorderRadius.circular(cubit.currentIndex==1? 15:0),

                            ),
                            child: Center(
                              child: Text('SIGN UP',
                                style: TextStyle(
                                    color:cubit.currentIndex==1?Colors.orangeAccent:Colors.grey[300],
                                  fontWeight:FontWeight.w900,
                                  fontSize: 12


                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                SizedBox(height: 32),
                Expanded(
                  child: IndexedStack(
                    index: cubit.currentIndex,

                    children: [
                      LoginSreen(),
                      RegisterScreen(),
                    ],
                  ),
                ),
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
