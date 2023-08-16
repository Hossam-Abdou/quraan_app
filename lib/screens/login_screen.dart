import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=SystemCubit.get(context);
        return Scaffold(
          body: ListView.builder(
              itemCount:  cubit.surahModel?.data?.length ?? 0,
              itemBuilder: (context, index) =>

                  Text('${cubit.surahModel!.data![index]}',style: TextStyle(color: Colors.black,fontSize: 30),)
          ),
        );
      },
    );
  }
}
