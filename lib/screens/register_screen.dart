import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Creating Account',style: TextStyle(color: Color(0xfffa7031),fontSize: 24),),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'E-Mail',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey)
              ),
            ),
            Row(

              children: [
                Checkbox(
                    value: true,
                    fillColor: MaterialStatePropertyAll(Color(0xfffa7031)),
                    onChanged: (pas)
                    {
                      print('err');
                    }
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                  const Text('I agree all statments in'),
                  const Text('terms of services',style: TextStyle(color: Color(0xfffa7031)),),
                ],)
              ],
            ),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffee3e28),
              ),
              width: 195,
              height: 40,
              child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 20),)),
            ),


          ],
        ),
      ),
    );
    ;
  }
}
