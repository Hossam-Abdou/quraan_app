import 'package:flutter/material.dart';

class AuthenticateButton extends StatelessWidget {
String? text;

AuthenticateButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffee3e28),
      ),
      height: 40,
      child:  Center(
          child: Text(
            '${text}',
            style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
          )),
    );
  }
}
