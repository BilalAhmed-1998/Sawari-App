import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sawari/Classes/RideDetails.dart';

class DatabaseCollection {

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("Passengers");

  final CollectionReference onGoingRides =
  FirebaseFirestore.instance.collection("onGoingRides");


  Future bookPassengerRide(RideDetails rideDetails) async{

    GeoPoint pickupCoordinates = GeoPoint(rideDetails.pickup.latitude, rideDetails.pickup.longitude);
    GeoPoint dropoffCoordinates = GeoPoint(rideDetails.dropOff.latitude, rideDetails.dropOff.longitude);


    onGoingRides.doc(FirebaseAuth.instance.currentUser.uid).set({
      'uidPassenger': FirebaseAuth.instance.currentUser.uid,
      'status': 'pending',
      'pickup' : rideDetails.pickup.placeName,
      'pickupCoordinates' : pickupCoordinates,
      'dropOff' : rideDetails.dropOff.placeName,
      'dropoffCoordinates' : dropoffCoordinates,
      'fare' : rideDetails.fare,
      'passengerName' : FirebaseAuth.instance.currentUser.displayName ?? "Passenger",
      'passengerPhone' : FirebaseAuth.instance.currentUser.phoneNumber,
      'rideType' : rideDetails.carType,
      'timeOfRideRequest' : rideDetails.dateTime,

    });

  }

  Future cancelPassengerRide() async{

    await onGoingRides.doc(FirebaseAuth.instance.currentUser.uid).delete();

  }

 Future updateRideStatus(String status) async {

    await onGoingRides.doc(FirebaseAuth.instance.currentUser.uid).update({
      'status' : status
    });




 }

 Future updateDriverInfo(String rideId, Position coord) async {
    
    String driverName = "Ali";
    String driverPhone = '+923175226246';
    String driverCar = "Mehran 2007";
    double rating = 4.2;
    GeoPoint driverCoordinates = GeoPoint(coord.latitude, coord.longitude);

    await onGoingRides.doc(rideId).update({

     "driverName" : "Ali",
     "driverPhone" : '+923175226246',
     "driverCar" : "Mehran 2007",
     "rating" : 4.2,
      "driverCoordinates" : driverCoordinates,
      "status" : "Accepted",
    });

   // await onGoingRides.doc(FirebaseAuth.instance.currentUser.uid).update({
   //   'driverName':
   // });
   //


 }


}