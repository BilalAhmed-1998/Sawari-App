

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sawari/Classes/Address.dart';
import 'package:sawari/Classes/User.dart';

class RideDetails{

  ouruser passenger;
  Address pickup;
  Address dropOff;
  Timestamp dateTime;
  int fare;
  int carType;

  RideDetails({this.carType,this.dateTime,this.pickup,this.dropOff,this.fare}){
   passenger = ouruser();
  }

}