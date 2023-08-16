import 'package:flutter/material.dart';

Widget LoginSreen() => Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'UserName',
                hintStyle: TextStyle(fontWeight: FontWeight.w300)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(fontWeight: FontWeight.w300)),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Forget Password',
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
              )),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffee3e28),
          ),
          width: 195,
          height: 40,
          child: Center(
              child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff333333),
          ),
          width: 195,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'images/facebook.png',
                height: 25,
                color: Colors.white,
              ),
              Center(
                  child: Text(
                'Login With Facebook',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
            ],
          ),
        ),
      ],
    );
