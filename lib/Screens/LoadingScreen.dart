

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sawari/credentials.dart' as globals;

class LoadingScreen extends StatelessWidget {
  static const routeName = '/LoadingScreen';
  //const LoadingScreen({Key? key}) : super(key: key);

  String msg;

  LoadingScreen({this.msg});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Dialog(

      backgroundColor: Colors.cyan,
      elevation: 4,
      child: Container(
       // height: 100,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Row(
          children: [
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),),
            SizedBox(width: 20,),
            Text(this.msg,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
            ),
            ),
          ],

        ),
      ),


    );
  }
}


class DriverLoadingScreen extends StatelessWidget {
  static const routeName = '/DriverLoadingScreen';
  //const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Dialog(

      backgroundColor: Colors.white,
      elevation: 4,
      child: Container(
         height: 500,
        width: width-100,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: globals.profilePic != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(

                      globals.profilePic,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                      :Container(),

                ),

                Text(globals.fName +" "+ globals.lName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        SizedBox(height: 20,),
        Text(globals.carMake +" "+globals.carModel + " " + globals.carPlate,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "poppin",
            fontWeight: FontWeight.bold,
          ),

        ),
        SizedBox(height: 20,),
        Text("Driver is on his way...",
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 15,
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
          ),
        ),

          ],

        ),
      ),


    );
  }
}
