import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';
import 'package:quraan_app_test/components/customField.dart';

import '../main_screens/home_screen.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      listener: (context, state) async{
        if(state is ChatLoginSuccess)
        {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
          const snackBar = SnackBar(
            content: Text('Login Successfully'),
            backgroundColor: Colors.orangeAccent,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if(state is ChatLoginError)
        {
          SnackBar snackBar = SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit=SystemCubit.get(context);
        return Column(
          children: [
            CustomField(hintText: 'UserName',controller: cubit.emailController),
            CustomField(hintText:'Password',controller: cubit.passwordController),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password',
                    style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: ()
              {
                cubit.Login();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffee3e28),
                ),
                width: 195,
                height: 40,
                child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff333333),
              ),
              width: 195,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'images/facebook.png',
                    height: 25,
                    color: Colors.white,
                  ),
                  const Center(
                      child: Text(
                        'Login With Facebook',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
