import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sawari/Screens/DriverProfilePage.dart';
import 'package:sawari/Screens/DriverLicensePage.dart';
import 'package:sawari/Screens/VehicleInfoPage.dart';
import 'package:sawari/Screens/DriverCNICPage.dart';
import 'package:sawari/credentials.dart' as globals;


import '../credentials.dart';

class DriverRegPage extends StatefulWidget {

  static const routeName = '/DriverRegPage';

  @override
  DriverRegPageState createState() => DriverRegPageState();
}

class DriverRegPageState extends State<DriverRegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Driver Registration',
        style:TextStyle(color:Colors.black)),
        iconTheme: IconThemeData(color: Colors.cyan.shade600),
      ),
      // drawer: SafeArea(
      //   child: Drawer(
      //     child: Container(
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height,
      //       color: Colors.white24,
      //       child: ListView(
      //         padding: EdgeInsets.zero,
      //         children: [
      //       //     DrawerHeader(
      //       // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 1.0),
      //       //
      //       // //padding: EdgeInsets.all(0.0),
      //       //       decoration: BoxDecoration(
      //       //         color: Colors.cyan.shade600,
      //       //           ),
      //       //       child: Text("Profile"),
      //       //     ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Row(
      //             children: [
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               CircleAvatar(
      //                 backgroundColor: Colors.cyan,
      //                 backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")
      //               ),
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               Text(
      //                 globals.fName,
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.w500,
      //                   fontSize: 20,
      //                 ),
      //               )
      //             ],
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Divider(
      //             height: 3,
      //             thickness: 3,
      //           ),
      //           ListTile(
      //             leading: Icon(
      //                 Icons.home,
      //               color: Colors.cyan,
      //             ),
      //             title: Text("Home"),
      //             horizontalTitleGap: 0,
      //             onTap: () {
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //           ListTile(
      //             leading: Icon(
      //                 Icons.history,
      //               color: Colors.cyan,
      //             ),
      //             title: Text("History"),
      //             horizontalTitleGap: 0,
      //             onTap: () {
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //           ListTile(
      //             leading: Icon(
      //                 Icons.settings,
      //               color: Colors.cyan,
      //             ),
      //             title: Text("Settings"),
      //             horizontalTitleGap: 0,
      //             onTap: () {
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //           ListTile(
      //             leading: Icon(
      //                 Icons.help,
      //               color: Colors.cyan,
      //             ),
      //             title: Text("Help"),
      //             horizontalTitleGap: 0,
      //             onTap: () {
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //           ListTile(
      //             leading: Icon(
      //                 Icons.support,
      //               color: Colors.cyan,
      //             ),
      //             title: Text("Support"),
      //             horizontalTitleGap: 0,
      //             onTap: () {
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //           SizedBox(
      //             height: 250,
      //           ),
      //           Divider(
      //             height: 3,
      //             thickness: 3,
      //           ),
      //           Align(
      //             child: Container(
      //               margin: EdgeInsets.all(20),
      //               padding: EdgeInsets.all(15),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(50),
      //                   border: Border.all(color: Colors.cyan,width: 2)
      //               ),
      //               child: Text(
      //                 'Switch to passenger',
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 20,
      //                 ),
      //
      //               ),
      //               alignment: Alignment.bottomCenter,
      //             ),
      //           ),
      //
      //         ],
      //       ),
      //     ),
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Container(
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DriverProfilePage()));
                    },
                      child: const Text('Profile',textAlign: TextAlign.left),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriverLicensePage()));
                    },
                    child: const Text('Driver License',textAlign: TextAlign.left),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DriverCNICPage()));
                    },
                    child: const Text('CNIC',textAlign: TextAlign.left),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VehicleInfoPage()));
                    },
                    child: const Text('Vehicle Information',textAlign: TextAlign.left),
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
      ),



    );
  }
}