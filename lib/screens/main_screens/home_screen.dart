import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

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
            leading: const Icon(
              Icons.menu_rounded,
              color: Color(0xfffa7031),
            ),
            actions:const [
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
