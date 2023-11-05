import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  Function validate;

  CustomField({this.hintText, this.controller, required this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Color(0xfffa7031),
      validator: (value) {
        validate(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;

  const CustomTextField({
    required this.controller,
    required this.validator,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Color(0xfffa7031),
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
      ),
    );
  }
}
