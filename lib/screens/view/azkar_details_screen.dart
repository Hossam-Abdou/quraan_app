import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/screens/view_model/system_cubit.dart';

class SectionDetailScreen extends StatefulWidget {
  final int id;
  final String title;

  const SectionDetailScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _SectionDetailScreenState createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {
  @override
  void initState() {
    super.initState();
    SystemCubit.get(context).loadSectionDetail(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemCubit, SystemState>(
      builder: (context, state) {
        var cubit = SystemCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            centerTitle: true,
            title: Text(widget.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        color: Color(0xfffad0b6),
                        borderRadius: BorderRadius.circular(15),
                       ),
                    child: Column(
                      children: [
                        Text(
                          "${cubit.sectionDetails[index].reference}",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 20),

                        ),
                        SizedBox(height: 6,),
                        Text(
                          "${cubit.sectionDetails[index].content}",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 15),

                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 6,),
                itemCount: cubit.sectionDetails.length),
          ),
        );
      },
    );
  }
}
