// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sawari/Screens/LoginPage.dart';
import 'package:sawari/Screens/login_page.dart';


class RegisterPage extends StatelessWidget {

  static const routeName =  '/RegisterPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 120,),
          Text('Welcome to Sawari!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppin'
            ),
          ),
        Container(
        width: 250,
        height: 250,
        color: Colors.teal.shade50,
        alignment: Alignment.center,
        child: Image(image: AssetImage("assets/images/login01.png"),),
    ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){

              },
              child: Text('Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'sawari',
                  fontWeight: FontWeight.bold
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade600,
                  padding: EdgeInsets.fromLTRB(80, 15, 80, 15)
              )
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            child: Text('Register as a Driver',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'sawari',
                shadows: <Shadow>[
              Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 5.0,
              color: Color.fromARGB(100, 0, 0, 0),
            ),
            ]
            ),
          ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Already have an account?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sawari',
                ),
              ),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, LoginPage.routeName);
              },
                  child: Text('Sign in',
                  style: TextStyle(
                    color: Colors.cyan.shade600,
                    fontSize: 17,
                  ),
                  ),
                style: TextButton.styleFrom(
                 // padding: EdgeInsets.fromLTRB(1, 70, 1, 1),
                ),
              )
            ],
          ),

        ],
        ),
        ),
    );
  }
}

