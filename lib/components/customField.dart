import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
 String? hintText;
 TextEditingController? controller;

 CustomField({this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return    TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),

      ),
    );
  }
}
