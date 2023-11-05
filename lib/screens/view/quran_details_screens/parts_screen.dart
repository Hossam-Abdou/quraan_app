import 'package:flutter/material.dart';

class PartsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100,),
        Text(
          'الاجزاء',
          style: TextStyle(
              color: Colors.grey[400],
              fontSize: 30,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
