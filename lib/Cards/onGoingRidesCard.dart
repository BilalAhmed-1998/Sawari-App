import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sawari/Screens/driverConfirmationPage.dart';
import 'package:sawari/credentials.dart';


class onGoingRideCard extends StatelessWidget {

  String passengerName;
  String passengerPhoto;
  String passengerPhone;
  int fare;
  String pickup;
  GeoPoint pickupCoordinates;
  String dropOff;
  GeoPoint dropoffCoordinates;
  Timestamp timestamp;
  String rideId;

  onGoingRideCard({this.rideId,this.timestamp,this.dropOff,this.dropoffCoordinates,this.pickupCoordinates,this.fare,this.pickup,this.passengerName,this.passengerPhone});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan.shade50,
        borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.cyan,
            width:1,
          )),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.cyan, shape: BoxShape.circle),
                      height: 50,
                      width: 50,
                      child:Icon(CupertinoIcons.person,
                      color: Colors.white,
                      size: 25,)
                  ),
                  const SizedBox(width: 10,),
                  Text(passengerName,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  "Rs: $fare ",
                  style: TextStyle(
                    color: Colors.redAccent.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),



            ],
          ),
          SizedBox(height: 15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 8),
                      const Icon(
                         Icons.location_on,
                         color: Colors.green,
                         size: 30,
                       ),
                      SizedBox(width: 10,),
                      Container(
                        width: 200,
                        child: Text(
                          pickup,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                         Icons.location_on,
                         color: Colors.redAccent.shade700,
                         size: 30,
                       ),
                      SizedBox(width: 10,),
                      Container(
                        width: 200,
                        child: Text(
                          dropOff,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,

                      ),
                    onPressed: () async {




                      await dbMain.updateRideStatus("onGoing");


                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => driverConfirmationPage(
                            pickupCoordinates: pickupCoordinates,
                            Name: passengerName,
                            Phone: passengerPhone,
                            rideId: rideId,
                          )
                        )
                      );

                    },
                    child: const Text("Accept",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),),
                ),
              ),
            ],
          )



        ],
      ),




    );
  }
}




