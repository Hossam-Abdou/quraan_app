import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app_test/blocs/system_cubit.dart';

class SheikhScreen extends StatefulWidget {

  @override
  State<SheikhScreen> createState() => _SheikhScreenState();
}

class _SheikhScreenState extends State<SheikhScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,),
        Text(
          'الشيوخ',
          style: TextStyle(
              color: Colors.grey[400],
              fontSize: 30,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
