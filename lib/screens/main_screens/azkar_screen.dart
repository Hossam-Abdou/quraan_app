import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

class AzkarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = SystemCubit.get(context);
    SystemCubit.get(context).getAllAzkar();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child: Column(
          children: [
            Text('الادعية و الاذكار',style: TextStyle(color: Color(0xfffa7031),fontSize: 40,fontWeight: FontWeight.w900),),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index)
              {
                List<String> texts = ['Text 1', 'Text 2', 'Text 3', 'Text 4', 'Text 5'];
                return Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: Offset(0, 2), // Offset of the shadow
                        spreadRadius: 1, // Spread radius
                      ),
                    ],
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(texts[index], style: TextStyle(fontSize: 20),),
                      Text('${cubit.azkarModel?.b?[0].content}', style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w900,),),
                    ],
                  ),
                );},
                separatorBuilder: (context, index) =>SizedBox(height: 15,) ,
            )
          ],
        ),
      ),
    );
  },
);
  }
}
