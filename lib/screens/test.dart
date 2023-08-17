import 'package:flutter/material.dart';

class Test extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     dynamic re()
    {
      List.generate(
        5,
            (index) => Container(
          height: 100,
          width: double.infinity,
          color: Colors.blue,
          child: Text('Container ${index + 1}'),
        ),
      );

    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.blue,
              child: Text('Container 1'),
            ),
            re()
          ],
        ),
      ),
    );
  }
}
