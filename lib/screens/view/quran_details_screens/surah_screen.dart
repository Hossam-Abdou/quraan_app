import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/screens/view_model/system_cubit.dart';

import '../ayah_screen.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  void initState() {
    super.initState();
    SystemCubit.get(context).loadQuraan(context,SystemCubit.get(context).quraanList.map((e) => e.id));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemCubit, SystemState>(
  builder: (context, state) {
    var cubit = SystemCubit.get(context);
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Divider(
            color: Colors.black,
            height: 1,
          ),
        ),
        itemCount: cubit.quraanList.map((e) => e.id).length,
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
                      '${cubit.quraanList[index].id}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                title: Text(
                  '${cubit.quraanList[index].name}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 23),
                ),
                subtitle: Text(
                  '${cubit.quraanList[index].array?.length} - ${cubit.quraanList[index].type}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Colors.black),
                ),
                trailing:
                const Icon(Icons.arrow_forward_ios_rounded)),
          ),
        ),
      ),
    );
  },
);
  }
}
