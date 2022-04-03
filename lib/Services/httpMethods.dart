

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sawari/Classes/Address.dart';
import 'package:sawari/Classes/DirectionDetails.dart';
import 'package:sawari/Services/DataChangesOverTime.dart';
import 'package:sawari/Services/httpRequest.dart';

class httpMethods {

  String APIkey = "AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI";

  static Future<String> coordinatesToDecode(Position position , context) async{
   // String fromattedDecodedAddress ="";
 String decodedAddress = "";
 String st0,st1,st2,st3,st4;
 String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+position.latitude.toString()+","+position.longitude.toString()+"&key=AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI";
 var response = await httpRequest.getRequest(url);
 if(response != "failed"){
   //decodedAddress = response["results"][0]["formatted_address"];

   st0 = response["results"][0]["address_components"][0]["long_name"];
   st1 = response["results"][0]["address_components"][1]["long_name"];
   st2 = response["results"][0]["address_components"][2]["long_name"];
 //  st3 = response["results"][0]["address_components"][4]["long_name"];
   st4 = response["results"][0]["address_components"][5]["long_name"];

   decodedAddress = st0 + ", "+ st1 + ", " + st2 + ", " + st4;
   Address userPickupLocation = Address();
   userPickupLocation.latitude = position.latitude;
   userPickupLocation.longitude= position.longitude;
   userPickupLocation.placeName = decodedAddress;

   Provider.of<DataChangesOverTime>(context, listen: false).updatePickUpLocationAddress(userPickupLocation);

 }

 return decodedAddress;


  }

  static Future<DirectionDetails> obtainPlaceDirectionsDetails(LatLng initialPosition,LatLng finalPosition)async{




    String directionUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI";

    var directionRes = await httpRequest.getRequest(directionUrl);

    // print("LATLANGGGGGGGGGGGGGGGG!!!!");
    // print(initialPosition.latitude);
    // print(initialPosition.longitude);
    // print(finalPosition.latitude);
    // print(finalPosition.latitude);

    if(directionRes == "failed"){
      print("WTHHHHHHHHHHHHHHHHHHHH!");
      return null;
    }
    DirectionDetails directionDetails = DirectionDetails();

    directionDetails.encodedPoints = directionRes["routes"][0]["overview_polyline"]["points"];

    directionDetails.distanceText = directionRes["routes"][0]["legs"][0]["distance"]["text"];
    directionDetails.distanceValue = directionRes["routes"][0]["legs"][0]["distance"]["value"];

    directionDetails.durationText = directionRes["routes"][0]["legs"][0]["duration"]["text"];
    directionDetails.durationValue = directionRes["routes"][0]["legs"][0]["duration"]["value"];

      print("Direction Details: //////////////////////////////");
    print(directionDetails.encodedPoints);
    return directionDetails;

  }

  static int calculateTax(DirectionDetails directionDetails){

    double timeTravelTax = (directionDetails.durationValue/60)* 0.05;
    double distanceTravelTax = (directionDetails.distanceValue/1000)* 0.1;
    double totalFare = timeTravelTax+distanceTravelTax;

    //converting to pakistani Rupees//
    return (totalFare * 170).truncate();

  }

}