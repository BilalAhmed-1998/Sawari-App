import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sawari/Screens/DriverTransportPage.dart';
import 'package:sawari/Screens/NumberPlatePage.dart';
import 'package:sawari/Screens/VehiclePicturePage.dart';
//import 'package:test_proj/driver_license.dart';
//import 'package:test_proj/DriverTransportPage.dart';
//import 'package:test_proj/NumberPlatePage.dart';


class VehicleInfoPage extends StatefulWidget {

  static const routeName = '/VehicleInfoPage';

  @override
  VehicleInfoPageState createState() => VehicleInfoPageState();
}

class VehicleInfoPageState extends State<VehicleInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Vehicle Information',
            style:TextStyle(color:Colors.black)),
            leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.cyan.shade600),
            tooltip: "Cancel and Return to List",
            onPressed: () {
            Navigator.pop(context, true);
            },),
      ),


      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.teal[50],

        child:Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    color: Colors.teal[50],
                    child: Image.asset('assets/images/circles.png')
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade100,
                    blurRadius: 100.0,
                    //offset: Offset(10, 10),
                  ),
                ],
                border: Border.all(
                  color: Colors.cyan.shade600,
                  width: 3,
                ),
              ),


              width: MediaQuery.of(context).size.width/1.2,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DriverTransportPage()));
                },
                child: const Text('Vehicle Details',textAlign: TextAlign.left),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20,color: Colors.black),

                ),
              ),

            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade100,
                    blurRadius: 100.0,
                    //offset: Offset(10, 10),
                  ),
                ],
                border: Border.all(
                  color: Colors.cyan.shade600,
                  width: 3,
                ),
              ),


              width: MediaQuery.of(context).size.width/1.2,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NumberPlatePage()));
                },
                child: const Text('Number Plate',textAlign: TextAlign.left),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),

                ),
              ),

            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade100,
                    blurRadius: 100.0,
                    //offset: Offset(10, 10),
                  ),
                ],
                border: Border.all(
                  color: Colors.cyan.shade600,
                  width: 3,
                ),
              ),


              width: MediaQuery.of(context).size.width/1.2,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VehiclePicturePage()));
                },
                child: const Text('Vehicle Picture',textAlign: TextAlign.left),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),

                ),
              ),

            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade100,
                    blurRadius: 100.0,
                    //offset: Offset(10, 10),
                  ),
                ],
                border: Border.all(
                  color: Colors.cyan.shade600,
                  width: 3,
                ),
              ),


              width: MediaQuery.of(context).size.width/1.2,
              child: TextButton(
                onPressed: () {},
                child: const Text('Vehicle Certificate',textAlign: TextAlign.left),
                style: TextButton.styleFrom(
                  primary: Colors.grey[800],
                  textStyle: const TextStyle(fontSize: 20),

                ),
              ),

            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/1.31,
              height: MediaQuery.of(context).size.height / 15,
              child:RaisedButton(
                child: const Text('Done',
                  style: TextStyle(fontSize: 20, fontFamily: "assets/fonts/Poppins-Black.ttf"),
                ),
                color: Colors.cyan.shade600,
                textColor: Colors.white,
                elevation: 5,
                padding: const EdgeInsets.all(10),
                onPressed: () {
                },
              ),
            ),
          ],


        ),
      ),



    );
  }
}