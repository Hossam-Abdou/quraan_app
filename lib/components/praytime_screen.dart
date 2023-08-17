import 'package:flutter/material.dart';

class PrayTime extends StatelessWidget {
String? name;
String? time;

PrayTime({this.name, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(40),
              color: Colors.white24,
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(time!,style: TextStyle(fontSize: 20),),
                Text(name!,
                  style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,),),
              ],
            ),
          ),
         const SizedBox(height: 15),
        ],
      ),
    );
  }
}
