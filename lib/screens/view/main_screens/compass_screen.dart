import 'package:flutter/material.dart';

class CompassScreen extends StatelessWidget {
  const CompassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'القبلة',
              style: TextStyle(
                  color: Color(0xfffa7031),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'images/compass_image.png',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
