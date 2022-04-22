// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sawari/Cards/onGoingRidesCard.dart';
import 'package:sawari/Screens/DriverRegPage.dart';
import 'package:sawari/Screens/LoadingScreen.dart';
import 'package:sawari/credentials.dart' as globals;
import 'package:flutter_switch/flutter_switch.dart';

import 'HomePage.dart';
import 'LoginPage.dart';

class driver_homepage extends StatefulWidget {
  static const routeName = '/driver_homepage';

  @override
  _driver_homepageState createState() => _driver_homepageState();
}

class _driver_homepageState extends State<driver_homepage> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: const Text('SAWARI',
            style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold)),
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white24,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: globals.profilePic != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            globals.profilePic,
                            fit: BoxFit.fitWidth,
                          ),
                        )
                            :Container(
                          height: 0,
                          width:0,
                        ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      globals.fName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.cyan,
                  ),
                  title: Text("Home",
                  style: TextStyle(
                    color: Colors.black,
                  ),),
                  horizontalTitleGap: 0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.history,
                    color: Colors.cyan,
                  ),
                  title: Text("History",style: TextStyle(
                    color: Colors.black,
                  ),),
                  horizontalTitleGap: 0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.cyan,
                  ),
                  title: Text("Settings",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  horizontalTitleGap: 0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.cyan,
                  ),
                  title: Text("Help",
                    style: TextStyle(
                      color: Colors.black,
                    ),),
                  horizontalTitleGap: 0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.support,
                    color: Colors.cyan,
                  ),
                  title: Text("Support",
                    style: TextStyle(
                      color: Colors.black,
                    ),),
                  horizontalTitleGap: 0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.app_registration,
                    color: Colors.cyan,
                  ),
                  title: Text("Online Registration",
                    style: TextStyle(
                      color: Colors.black,
                    ),),
                  horizontalTitleGap: 0,
                  onTap: () {
                    if(globals.regDone==false)
                      {
                        Navigator.of(context).pushNamed(DriverRegPage.routeName);
                      }
                    else
                      {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: Text('You are already registered!!',
                              textAlign: TextAlign.center,),
                              contentPadding: EdgeInsets.symmetric(vertical: 50),
                            )
                        );
                      }

                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.cyan,
                  ),
                  title: Text("Logout",
                    style: TextStyle(
                      color: Colors.black,
                    ),),
                  horizontalTitleGap: 0,
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginPage.routeName, (Route<dynamic> route) => false);
                  },
                ),
                SizedBox(
                  height: 150,
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                ),
                Align(
                  child: InkWell(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.cyan,width: 2)
                      ),
                      child: Text(
                        'Switch to passenger',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),

                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          HomePage.routeName, (Route<dynamic> route) => false);
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            FlutterSwitch(

              width: 140.0,
              height: 40.0,
              activeText: 'ONLINE',
              inactiveText: 'OFFLINE',
              activeColor: Colors.green,
              valueFontSize: 20.0,
              toggleSize: 35.0,
              value: status,
              borderRadius: 40.0,
              padding: 8.0,
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),
            (status)
            ?Flexible(
              flex: 1,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("onGoingRides").snapshots(),
                  builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return
                      ListView.builder(
                      itemCount: snapshot.data.docs.length,
                        itemBuilder: (context,index){
                        DocumentSnapshot ride = snapshot.data.docs[index];
                        return
                          onGoingRideCard(
                            rideId: ride['uidPassenger'],
                          passengerName: ride['passengerName'],
                          passengerPhone: ride['passengerPhone'],
                          pickup: ride['pickup'],
                          dropOff: ride['dropOff'],
                          pickupCoordinates: ride['pickupCoordinates'],
                          dropoffCoordinates: ride['dropoffCoordinates'],
                          fare: ride['fare'],
                          timestamp: ride['timeOfRideRequest'],
                        );

                        }
                    );

                  }else{

                    return CircularProgressIndicator();

                  }



                  })
              )

            :Container(),
          ],
        ),
      ),
    );
  }
}
