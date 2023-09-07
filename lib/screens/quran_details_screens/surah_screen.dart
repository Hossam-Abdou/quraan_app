import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

import '../../screens/ayah_screen.dart';

class SurahScreen extends StatelessWidget { 
  const SurahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = SystemCubit.get(context);
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Divider(
            color: Colors.black,
            height: 1,
          ),
        ),
        itemCount: cubit.surahModel?.data?.length ?? 0,
        itemBuilder: (context, index) => Directionality(
          textDirection: TextDirection.rtl,
          child: InkWell(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AyahScreen(
                surahIndex: index,
              ),));

            },
            child: ListTile(
                leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black,
                    child: Text(
                      '${cubit.surahModel!.data![index].number}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                title: Text(
                  '${cubit.surahModel!.data![index].name}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 23),
                ),
                subtitle: Text(
                  '${cubit.surahModel!.data![index].numberOfAyahs} - ${cubit.surahModel!.data![index].revelationType}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Colors.black),
                ),
                trailing:
                Icon(Icons.arrow_forward_ios_rounded)),
          ),
        ),
      ),
    );
  },
);
  }
}
