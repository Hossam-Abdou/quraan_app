import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/system_cubit.dart';
import '../../components/authenticate_button.dart';
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
          SystemCubit.get(context).clearController();
          const snackBar = SnackBar(
            content: Text('Registered Successfully'),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is ChatRegisterError) {
          SnackBar snackBar = SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = SystemCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  Text(
                    'Creating Account',
                    style: TextStyle(color: Color(0xfffa7031), fontSize: 20),
                  ),
                 const SizedBox(height: 20,),
                  TextFormField(
                controller: cubit.userNameController,
                cursorColor: Colors.deepOrange,
                validator:(value) {
                  if(value!.isEmpty)
                  {
                    return 'The Field Can\'t Be Empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),

                ),
              ),
                  CustomTextField(
                    validator:(value) {
                      if(value!.isEmpty)
                      {
                        return 'The Field Can\'t Be Empty';
                      }
                      if(!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
                      {
                        return 'Please Enter Valid E-Mail';
                      }
                      return null;
                    },
                    controller: cubit.emailController,
                    hintText: 'E-mail',
                  ),
                  TextFormField(
                controller: cubit.passwordController,
                cursorColor: Colors.deepOrange,
                validator:(value) {
                  if(value!.isEmpty)
                  {
                    return 'The Field Can\'t Be Empty';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),

                ),
              ),
                  TextFormField(
                controller: cubit.confirmPasswordController,
                cursorColor: Colors.deepOrange,
                validator:(value) {
                  if(value!.isEmpty)
                  {
                    return 'The Field Can\'t Be Empty';
                  }
                  if(cubit.passwordController.text!=cubit.confirmPasswordController.text)
                    {
                      return 'The Password s not match';
                    }

                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),

                ),
              ),
                  SizedBox(height: 22,),

                  Row(
                    children: [
                      Checkbox(
                          value: true,
                          fillColor: MaterialStatePropertyAll(Color(0xfffa7031)),
                          onChanged: (pass) {}),
                      const Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('I agree all statements in '),
                          Text('terms of services',
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
                    onTap: () async{
                      if(cubit.formKey.currentState!.validate()){
                        cubit.Register();

                      }

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: AuthenticateButton(text: 'Register',),
                    )
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
