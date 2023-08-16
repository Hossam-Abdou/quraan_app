import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

class QuraanScreen extends StatefulWidget {
  @override
  State<QuraanScreen> createState() => _QuraanScreenState();
}

class _QuraanScreenState extends State<QuraanScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SystemCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: const Icon(
              Icons.menu_rounded,
              color: Color(0xfffa7031),
            ),
            actions: const [
               Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xfffa7031),
                ),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                'images/Layer 1.png',
                height: 100,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(17)),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            cubit.switchButton(0);
                          },
                          child: Text(
                            'السور',
                            style: TextStyle(
                                color: cubit.currentIndex == 0
                                    ? Color(0xfff1482a)
                                    : Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 19),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          child: VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.switchButton(1);
                          },
                          child: Text('الاجزاء',
                              style: TextStyle(
                                  color: cubit.currentIndex == 1
                                      ? Color(0xfff1482a)
                                      : Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 19)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          child: VerticalDivider(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.switchButton(2);
                          },
                          child: Text('الشيوخ',
                              style: TextStyle(
                                  color: cubit.currentIndex == 2
                                      ? Color(0xfff1482a)
                                      : Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 19)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
      cubit.currentIndex==0?
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.0),
                      child: Divider(
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                    itemCount: cubit.ayahs?.data?.length ?? 0,
                    itemBuilder: (context, index) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: InkWell(
                        onTap: ()
                        {
                        },
                        child: ListTile(
                            leading: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.black,
                                child: Text(
                                  '${cubit.ayahs!.data![index].number}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                            title: Text(
                              '${cubit.ayahs!.data![index].name}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 23),
                            ),
                            subtitle: Text(
                              '${cubit.ayahs!.data![index].numberOfAyahs} - ${cubit.ayahs!.data![index].revelationType}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded)),
                      ),
                    ),
                  ),
                )

              :cubit.currentIndex==1?Text('الاجزاء'):Text('الشيوخ'),
        
            ],
          ),
        );
      },
    );
  }
}
