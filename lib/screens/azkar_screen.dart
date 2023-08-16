import 'package:flutter/material.dart';

class AzkarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading:Icon(Icons.menu_rounded,color: Color(0xfffa7031),) ,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search,color: Color(0xfffa7031),),
          )

        ],
      ),
      body: Column(
        children: [
          Text('data'),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) =>Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
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
                    Text('3:40 am',style: TextStyle(fontSize: 20),),
                    Text('الفجر',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,),),
                  ],
                ),
              ),
            ),
              separatorBuilder: (context, index) =>SizedBox(height: 15,) ,
          )
        ],
      ),
    );
  }
}
