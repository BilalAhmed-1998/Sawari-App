

import 'package:flutter/material.dart';
import 'package:sawari/credentials.dart';


class LoadingScreenButton extends StatelessWidget {
  static const routeName = '/LoadingScreenButton';

  String msg;

  LoadingScreenButton({this.msg});

  //const LoadingScreenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      child: Dialog(

        backgroundColor: Colors.cyan,
        elevation: 2,
        child: Container(
          // height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
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
              ElevatedButton(onPressed: ()async{
                await dbMain.cancelPassengerRide();
                Navigator.pop(context);

              },
                  child: Text("Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),))
            ],
          ),
        ),


      ),
    );
  }
}
