// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  static const routeName = '/';
  int duration = 0;
  String goTopage;

 SplashScreen({this.duration,this.goTopage});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration),(){
    Navigator.pushNamed(context,goTopage);
      //    Navigator.push(context, MaterialPageRoute(builder: (context)=> this.goTopage));
    });

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
        width: 200,
        height: 100,
        color: Colors.teal.shade50,
        alignment: Alignment.center,
        child: Image(image: AssetImage("assets/images/marker.png"),),
    ),
        Text('SAWARI ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontFamily: 'arvo'
          ),
        ),
    ]

    ),
    ),
    );
  }
}