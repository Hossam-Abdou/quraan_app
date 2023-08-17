import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';
import 'package:quraan_app_test/screens/authenticate/login_screen.dart';
import 'package:quraan_app_test/screens/authenticate/register_screen.dart';

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
        var cubit = SystemCubit.get(context);
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      'images/Layer 1.png',
                      height: 160,
                    )),
                    Container(
                      width: 210,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
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
                              width: 104,
                              decoration: BoxDecoration(
                                border: cubit.buttonIndex == 0
                                    ? Border.all(width: 0, color: Colors.black)
                                    : null,
                                borderRadius: BorderRadius.circular(
                                    cubit.buttonIndex == 0 ? 15 : 0),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: cubit.buttonIndex == 0
                                          ? Color(0xfffa7031)
                                          : Colors.grey[300],
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13),
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
                              width: 104,
                              decoration: BoxDecoration(
                                border: cubit.buttonIndex == 1
                                    ? Border.all(width: 0, color: Colors.black)
                                    : null,
                                borderRadius: BorderRadius.circular(
                                    cubit.buttonIndex == 1 ? 15 : 0),
                              ),
                              child: Center(
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: cubit.buttonIndex == 1
                                          ? Color(0xfffa7031)
                                          : Colors.grey[300],
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    cubit.buttonIndex == 0 ? LoginScreen() : RegisterScreen(),
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
