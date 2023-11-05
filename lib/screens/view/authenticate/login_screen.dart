import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/screens/view_model/system_cubit.dart';
import '../components/authenticate_button.dart';
import '../components/customField.dart';
import '../main_screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      listener: (context, state) async {
        if (state is ChatLoginSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=> HomeScreen()
                ),);
            SystemCubit.get(context).clearController();


            const snackBar = SnackBar(
            content: Text('Login Successfully'),
            backgroundColor: Colors.orangeAccent,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is ChatLoginError) {
          SnackBar snackBar = SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = SystemCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'The Field Can\'t Be Empty';
                      }
                      return null;
                    },
                    controller: cubit.emailController,
                    hintText: 'UserName',
                  ),
                  CustomTextField(
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'The Field Can\'t Be Empty';
                      }
                      return null;
                    },
                    controller: cubit.passwordController,
                    hintText: 'Password',
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async{
                      if(cubit.formKey.currentState!.validate()){
                        cubit.Login();
                      }
                    },
                    child: AuthenticateButton(text: 'Login',)
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff333333),
                    ),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Image.asset(
                            'images/facebook.png',
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        const Center(
                            child: Text(
                          'Login With Facebook',
                          style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold),
                        )),
                      ],
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
