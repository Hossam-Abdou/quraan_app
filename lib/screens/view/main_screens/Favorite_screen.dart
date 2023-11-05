import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'لا توجد مفضلات',
        style: TextStyle(
            color: Colors.grey[400], fontSize: 30, fontWeight: FontWeight.w600),
      )),
    );
  }
}
