// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sawari/Screens/RegisterPage.dart';


class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              color: Colors.teal.shade50,
              alignment: Alignment.center,
              child: Image(image: AssetImage("assets/images/welcome01.png"),),
            ),
            SizedBox(height: 10,),
            Text('Getting started with Sawari ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppin'
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Text('Have a comfortable,safe and economic ride by taking freedom into your own hands',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sawari',
                ),
              ),
            ),
            SizedBox(height: 70,),
           ElevatedButton(
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
             },
         child: Text('Get Started',
           textAlign: TextAlign.center,
           style: TextStyle(
             fontSize: 20,
             fontFamily: 'sawari',
            fontWeight: FontWeight.bold
           ),
           ),
             style: ElevatedButton.styleFrom(
               primary: Colors.cyan.shade600,
               padding: EdgeInsets.fromLTRB(80, 20, 80, 20)
             )
           ),
          ],
        ),
      ),
    );
  }
}
