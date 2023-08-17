import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/system_cubit.dart';
import '../../components/customField.dart';
import '../main_screens/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      listener: (context, state) async {
        if (state is ChatRegisterSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
          const snackBar = SnackBar(
            content: Text('Registered Successfully'),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is ChatRegisterError) {
          const snackBar = SnackBar(
            content: Text('Error'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = SystemCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Creating Account',
                style: TextStyle(color: Color(0xfffa7031), fontSize: 24),
              ),
              CustomField(
                  hintText: 'Full Name', controller: cubit.userNameController),
              CustomField(
                  hintText: 'E-Mail', controller: cubit.emailController),
              CustomField(
                  hintText: 'Password', controller: cubit.passwordController),
              CustomField(
                  hintText: 'Confirm Password',
                  controller: cubit.confirmPasswordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: true,
                      fillColor: MaterialStatePropertyAll(Color(0xfffa7031)),
                      onChanged: (pass) {}),
                  const Column(
                    children: [
                      Text('I agree all statements in '),
                      Text(
                        'terms of services',
                        style: TextStyle(color: Color(0xfffa7031)),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  cubit.Register();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffee3e28),
                  ),
                  width: 195,
                  height: 40,
                  child: Center(
                      child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
            ],
          ),
        );
      },
    );
    ;
  }
}
