import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:sawari/Services/httpMethods.dart';
import 'package:sawari/Classes/DirectionDetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'LoadingScreen.dart';
import 'package:map_launcher/map_launcher.dart' as mapL;



class rideAcceptancePage extends StatefulWidget {
  //const rideAcceptancePage({Key? key}) : super(key: key);
  String Name;
  String Phone;
  GeoPoint driverCoordinates;
  GeoPoint userCoordinates;
  double rating;
  String carName;

  rideAcceptancePage({this.userCoordinates,this.rating,this.Phone,this.driverCoordinates,this.Name,this.carName});

  @override
  State<rideAcceptancePage> createState() => _rideAcceptancePageState();
}

class _rideAcceptancePageState extends State<rideAcceptancePage> {

  Marker pickUpLocMarker;
  Marker dropOffLocMarker;
  Position initialPos;

  DirectionDetails directionDetails;
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylineSet = {};
  GoogleMapController myMapController;
  Set<Marker> markers ={};
  Set<Circle> circles ={};

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png)).buffer.asUint8List();
  }

  void updateMarkerAndCircle(Position newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    pickUpLocMarker = Marker(
        markerId: MarkerId("home"),
        position: latlng,
        rotation: newLocalData.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
        icon: BitmapDescriptor.fromBytes(imageData));

  }
  void updateMarkerAndCircle2(Position newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    dropOffLocMarker = Marker(
        markerId: MarkerId("passenger"),
        position: latlng,
        rotation: newLocalData.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
        icon: BitmapDescriptor.fromBytes(imageData));

  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: const Text('Passenger Side',
            style:TextStyle(color:Colors.black,fontWeight: FontWeight.normal)),
      ),
      body: Stack(
        children: [
          Container(
            height: 750,
            child: GoogleMap(

              initialCameraPosition: const CameraPosition(
                target: LatLng(33.6844, 73.0479),
                zoom: 11.4746,
              ),

              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              myLocationEnabled: false,
              zoomGesturesEnabled: false,
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
              tiltGesturesEnabled: false,
              buildingsEnabled: false,
              trafficEnabled: false,
              // mapType: MapType.normal,
              polylines: polylineSet,
              markers: markers,
              circles: circles,
              onTap: (controller) {
                setState(() {
                });
              },
              onMapCreated: (controller) async{
                setState(() {
                  myMapController = controller;
                });

                showDialog(
                    context: context,
                    builder:(BuildContext context) => LoadingScreen(msg: "Loading directions...",)
                );
                await getPlaceDirection();


                Navigator.pop(context);
              },
            ),
          ),
          DraggableScrollableSheet(


            initialChildSize: 0.2,
            maxChildSize: 0.2,
            minChildSize: 0.2,
            builder: (BuildContext context, ScrollController scrollController) {
              return
                Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan.shade50,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: Radius.circular(18.0)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 16.0,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.7),
                        ),
                      ]),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()async{
                                  await launch("tel:"+widget.Phone);
                                  // await FlutterPhoneDirectCaller.callNumber(widget.Phone);
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.cyan, shape: BoxShape.circle),
                                  height: 55,
                                  width: 55,
                                  child:Image.asset("assets/images/call_icon.png",
                                    fit: BoxFit.fill,),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("Contact",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700
                                ),),
                            ],
                          ),
                          SizedBox(width: 100,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async{
                                  if (await MapLauncher.isMapAvailable(mapL.MapType.google)) {
                                    await MapLauncher.showDirections(
                                      origin: Coords(initialPos.latitude,initialPos.longitude),
                                      destination: Coords(widget.userCoordinates.latitude,widget.userCoordinates.longitude),
                                      mapType: mapL.MapType.google,
                                      originTitle: "Your Location",
                                      destinationTitle: "Passenger's Location",
                                    );
                                  }},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.cyan, shape: BoxShape.circle),
                                  height: 55,
                                  width: 55,
                                  child:Image.asset("assets/images/map_icon.png",
                                    fit: BoxFit.fill,),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(" Maps",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
            },

          ),

        ],


      ),
    );
  }

  Future<void> getPlaceDirection() async{

    Uint8List imageData = await getBytesFromAsset("assets/images/car_icon.png", 50);
    Uint8List imageData2 = await getBytesFromAsset("assets/images/user_icon.png", 100);

    Position userPos = Position(latitude: widget.userCoordinates.latitude,longitude: widget.userCoordinates.longitude);
    initialPos = Position(latitude: widget.driverCoordinates.latitude,longitude: widget.driverCoordinates.longitude);


    updateMarkerAndCircle2(userPos, imageData2); // user
    updateMarkerAndCircle(initialPos, imageData); // car

    print(userPos);
    print(initialPos);

    var pickupLatlng = LatLng(initialPos.latitude, initialPos.longitude);
    var dropoffLatlng = LatLng(userPos.latitude, userPos.longitude);

    var details = await httpMethods.obtainPlaceDirectionsDetails(pickupLatlng, dropoffLatlng);

    setState(() {
      directionDetails = details;
    });


    PolylinePoints polylinePoints = PolylinePoints();

    List<PointLatLng> decodedPolylinePoints = polylinePoints.decodePolyline(details.encodedPoints);

    polylineCoordinates.clear();
    if(decodedPolylinePoints.isNotEmpty){
      decodedPolylinePoints.forEach((PointLatLng pointLatLng) {

        polylineCoordinates.add( LatLng(pointLatLng.latitude,pointLatLng.longitude));

      });
    }

    polylineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
        color: Colors.cyan,
        polylineId: PolylineId("PolyLineID"),
        jointType: JointType.round,
        points: polylineCoordinates,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,

      );
      polylineSet.add(polyline);

    });

    LatLngBounds latLngBounds;
    if(pickupLatlng.latitude > dropoffLatlng.latitude && pickupLatlng.longitude > dropoffLatlng.longitude){
      latLngBounds = LatLngBounds(southwest: dropoffLatlng, northeast: pickupLatlng);
    }
    else if(pickupLatlng.longitude > dropoffLatlng.longitude){
      latLngBounds = LatLngBounds(southwest: LatLng(pickupLatlng.latitude,dropoffLatlng.longitude), northeast:  LatLng(dropoffLatlng.latitude,pickupLatlng.longitude));
    }
    else if(pickupLatlng.latitude > dropoffLatlng.latitude){
      latLngBounds = LatLngBounds(southwest: LatLng(dropoffLatlng.latitude,pickupLatlng.longitude), northeast:  LatLng(pickupLatlng.latitude,dropoffLatlng.longitude));
    }
    else{
      latLngBounds =   LatLngBounds(southwest: pickupLatlng, northeast: dropoffLatlng);
    }

    myMapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 80));

    //  pickUpLocMarker = Marker(
    //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    //   //icon: this.widget.userLocationIcon,
    //
    //   infoWindow: InfoWindow(title: "Driver Location",snippet: "My Location"),
    //   position: pickupLatlng,
    //   markerId: MarkerId("PickUpId"),
    // );
    //  dropOffLocMarker = Marker(
    //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    //   infoWindow: InfoWindow(title: "Passenger's Location",snippet: "Destination"),
    //   position: dropoffLatlng,
    //   markerId: MarkerId("DropOffId"),
    // );

    setState(() {
      markers.add(pickUpLocMarker);
      markers.add(dropOffLocMarker);
    });


  }

}
