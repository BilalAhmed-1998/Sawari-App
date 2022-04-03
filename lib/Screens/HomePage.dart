// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sawari/Classes/DirectionDetails.dart';
import 'package:sawari/Data.dart';
import 'package:sawari/Screens/LoadingScreen.dart';
import 'package:sawari/Screens/LoginPage.dart';
import 'package:sawari/Screens/SearchScreen.dart';
import 'package:sawari/Screens/driver_homepage.dart';
import 'package:sawari/Services/AuthService.dart';
import 'package:sawari/Services/DataChangesOverTime.dart';
import 'package:sawari/Services/httpMethods.dart';
import 'package:sawari/credentials.dart' as globals;

import 'DriverRegPage.dart';



class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';

  String searchDropOff = "Search Drop Off";
  BitmapDescriptor userLocationIcon;

  List <bool> isSelected = [true, false, false, false];
  List <Color> containerColors = [Colors.cyan,Colors.white,Colors.white,Colors.white];
  //const HomePage({Key? key}) : super(key: key);


  AuthService _auth = AuthService();
  HomePage() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(20, 20)), 'assets/images/userlocationicon.png')
        .then((onValue) {
      userLocationIcon = onValue;
    });
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DirectionDetails directionDetails;

  bool toggleStatus  = false;
  bool dropSet = false;
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylineSet = {};
  GoogleMapController myMapController;
  Set<Marker> markers ={};
  Set<Circle> circles ={};

  String addHome = "Add Home";

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
  void getCurrentPosition() async {
    Position curpos = await _determinePosition();
    //currentPosition = curpos;
    CameraPosition campos = CameraPosition(
        target: LatLng(curpos.latitude, curpos.longitude), zoom: 14.0);
    myMapController.animateCamera(CameraUpdate.newCameraPosition(campos));
    String decodedaddress = await httpMethods.coordinatesToDecode(curpos, context);
  }
  @override
  Widget build(BuildContext context) {

    addHome =Provider.of<DataChangesOverTime>(
        context).pickupLocation != null ? Provider.of<DataChangesOverTime>(context).pickupLocation.placeName : "Add Home";

    String decodedAddress = "";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //Position currentPosition;
    //var geolocator = Geolocator();



    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
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
                      backgroundColor: Colors.transparent,
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
                  title: Text("Home"),
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
                  title: Text("History"),
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
                  title: Text("Settings"),
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
                  title: Text("Help"),
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
                  title: Text("Support"),
                  horizontalTitleGap: 0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                // ListTile(
                //   leading: Icon(
                //     Icons.app_registration,
                //     color: Colors.cyan,
                //   ),
                //   title: Text("Online Registration"),
                //   horizontalTitleGap: 0,
                //   onTap: () {
                //     if(globals.regDone==false)
                //     {
                //       Navigator.of(context).pushNamed(DriverRegPage.routeName);
                //     }
                //     else
                //     {
                //       showDialog(
                //           context: context,
                //           builder: (_) => AlertDialog(
                //             content: Text('You are already registered!!',
                //               textAlign: TextAlign.center,),
                //             contentPadding: EdgeInsets.symmetric(vertical: 50),
                //           )
                //       );
                //     }
                //
                //   },
                // ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.cyan,
                  ),
                  title: Text("Logout"),
                  horizontalTitleGap: 0,
                  onTap: () {
                    this.widget._auth.SignOut();
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
                    onTap: (){
                      Navigator.pushNamed(context, driver_homepage.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.cyan,width: 2)
                      ),
                      child: Text(
                        'Switch to DriverSide',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),

                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.cyan.shade50,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "sawari",
          ),
        ),
        actions: [
          IconButton(
              color: Colors.black,
              onPressed: () async {
                this.widget._auth.SignOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginPage.routeName, (Route<dynamic> route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Stack(children: [
        Container(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(58.42796133580664, -122.085749655962),
              zoom: 14.4746,
            ),
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.normal,
            polylines: polylineSet,
            markers: markers,
            circles: circles,
            onTap: (controller) {
              setState(() {
              });
            },
            onMapCreated: (controller) async{

              getCurrentPosition();
              setState(() {
                myMapController = controller;
              });
            },
          ),
        ),
        SizedBox.expand(
          child:
    (!dropSet)
          ?DraggableScrollableSheet(

            initialChildSize: 0.3,
            maxChildSize: 0.6,
            minChildSize: 0.2,
            builder: (BuildContext context, ScrollController scrollController) {
              return
                Container(
                decoration: BoxDecoration(
                    color: Colors.cyan.shade50,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                    boxShadow: [
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              ToggleButtons(
                                //disabledBorderColor: Colors.white,
                                //borderColor: Colors.white,
                                children: [
                                  for (var i = 0; i < CarTypesList.length; i++)
                                    Container(
                                        padding: EdgeInsets.only(top: 10),
                                        margin: EdgeInsets.only(
                                          right: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          color: widget.containerColors[i],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        //padding: EdgeInsets.all(5.0),
                                        //height: 80,
                                        width: 100,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              CarTypesList[i].image,
                                              height: 40,
                                            ),
                                            Text(
                                              CarTypesList[i].title,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )),
                                ],
                                isSelected: widget.isSelected,
                                selectedColor: Colors.cyan,
                                renderBorder: false,
                                color: Color(0xff64748B),
                                fillColor: Colors.transparent,
                                splashColor: Colors.transparent,

                                onPressed: (int index) {
                                  setState(() {
                                    for(var j =0;j<widget.isSelected.length;j++)
                                    {
                                      if (j != index) {
                                        //isSelected[i] = false;
                                        this.widget.isSelected[j] = false;
                                        this.widget.containerColors[j] = Colors.white;
                                      }
                                      widget.isSelected[index] = true;
                                      widget.containerColors[index] = Colors.cyan;

                                    }
                                  });
                                }

                              ),
                            ]),

                        // child: ListView.builder(
                        //
                        //     shrinkWrap: false,
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: CarTypesList.length,
                        //     itemBuilder: (context, index) {
                        //       return CategoryCard(
                        //           data: CarTypesList[index], height: 80);
                        //     }),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        enableFeedback: true,
                        onTap: ()async{

                         var res = await Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(pickUpAddress: addHome,),),);
                         //Navigator.pushNamed(context,SearchScreen.routeName);

                         if (res != null){

                           setState(() {
                             this.widget.searchDropOff = res.toString();
                             dropSet = true;
                           });

                          await getPlaceDirection();

                         }
                         // var res = await Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));

                        },
                        child: Container(
                            padding: EdgeInsets.only(left: 5,),
                            height: 52,
                            width: width - 45,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff8a959e).withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 40,
                                  offset: Offset(0, 8),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child:
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.cyan,
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width-110,
                                  //color: Colors.green,
                                  child: Text(
                                    this.widget.searchDropOff,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 30.0,
                        child: Divider(
                          color: Colors.cyan,
                          thickness: 0.5,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              enableFeedback: true,
                              onTap: (){
                                getCurrentPosition();
                              },
                              child: Icon(
                                Icons.home,
                                color: Colors.cyan,
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width - 100,
                                  child: Text(addHome,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Your Home Address",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 30.0,
                          child: Divider(
                            color: Colors.cyan,
                            thickness: 0.5,
                          )),
                      Container(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.work,
                              color: Colors.cyan,
                              size: 22,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add Office",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),

                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Add Your Work Location",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 30.0,
                          child: Divider(
                            color: Colors.cyan,
                            thickness: 0.5,
                          )),
                      Container(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(

                              children: [
                                Icon(
                                  CupertinoIcons.money_dollar_circle_fill,
                                  color: Colors.cyan,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  "Payment Method",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),

                                ),
                              ],
                            ),
                            Container(
                              child: FlutterSwitch(
                                width: 100,
                                height: 40.0,
                                toggleColor: Colors.black,
                                inactiveIcon: Icon(CupertinoIcons.creditcard),
                                inactiveColor: Colors.white,
                                inactiveText: "Card",
                                inactiveTextColor: Colors.black,
                                activeText: "Cash",
                                activeTextColor: Colors.white,
                                activeColor: Colors.cyan.shade600,
                                disabled: false,
                                inactiveSwitchBorder: Border.all(
                                  width: 2.5,
                                  color: Colors.cyan,
                                ),
                                activeIcon: Icon(CupertinoIcons.money_dollar),
                                showOnOff: true,
                                value: toggleStatus,
                                valueFontSize: 15.0,
                                toggleSize: 35.0,
                                onToggle: (val){
                                  setState(() {
                                    toggleStatus = val;

                                  });

                                }, 

                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () async {

                          },
                          child: Container(
                            height: 50,
                            width: width-50,
                            child: Center(
                              child: Text(
                                'Request Ride',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'poppin',
                                ),
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan.shade600,
                            //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                          )),
                    ],
                  ),
                ),
              );
            },
          )
        :DraggableScrollableSheet(

      initialChildSize: 0.3,
      maxChildSize: 0.3,
      minChildSize: 0.2,
      builder: (BuildContext context, ScrollController scrollController) {
        return
          Container(
          decoration: BoxDecoration(
              color: Colors.cyan.shade50,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
              boxShadow: [
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.timer_fill,
                        color: Colors.cyan,
                        size: 22,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:width-80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Estimated Fare : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "poppin",
                                      fontSize: 16,
                                      //fontWeight: FontWeight.w900,
                                  ),

                                ),
                                //SizedBox(width: 100,),
                                Text(
                                  (directionDetails != null)?httpMethods.calculateTax(directionDetails).toString()+" Rs":"-",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),

                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            (directionDetails != null)?directionDetails.distanceText:"Distance not calculated yet",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 30.0,
                    child: Divider(
                      color: Colors.cyan,
                      thickness: 0.5,
                    )),
                ElevatedButton(
                    onPressed: () async{

                      showDialog(
                          context: context,
                          builder: (BuildContext context) => LoadingScreen(
                            msg: "Searching for Driver",
                          ));

                      await Future.delayed(const Duration(seconds: 5), (){});
                      Navigator.pop(context);

                      showDialog(
                          context: context,
                          builder: (BuildContext context) => DriverLoadingScreen());


                      globals.rideDetails.pickUpAdress =  addHome;
                      globals.rideDetails.fare = httpMethods.calculateTax(directionDetails);


                     // Navigator.pop(context);


                    },
                    child: Container(
                      height: 50,
                      width: width-50,
                      child: Center(
                        child: Text(
                          'Search Ride',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan.shade600,
                      //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                    )),
              ],
            ),
          ),
        );
      },





    ),
        ),
       (dropSet)
       ?Padding(
         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
         child: InkWell(
           enableFeedback: true,
           onTap: (){
             ResetHome();
           },
           child: CircleAvatar(
             radius: 20,
             backgroundColor: Colors.grey.shade100.withOpacity(0.7),
             child:  Icon(Icons.clear,
               size: 26,
               color: Colors.grey.shade600,),
           ),
         ),
       )
           :Container(),
      ]),
    );
  }

  Future<void> getPlaceDirection() async{

    var initialPos = Provider.of<DataChangesOverTime>(context,listen: false).pickupLocation;
    var finalPos = Provider.of<DataChangesOverTime>(context,listen: false).dropoffLocation;

    var pickupLatlng = LatLng(initialPos.latitude, initialPos.longitude);
    var dropoffLatlng = LatLng(finalPos.latitude, finalPos.longitude);

    showDialog(
        context: context,
        builder:(BuildContext context) => LoadingScreen(msg: "Searching Route...",)
    );

    var details = await httpMethods.obtainPlaceDirectionsDetails(pickupLatlng, dropoffLatlng);

    setState(() {
      directionDetails = details;
    });


    Navigator.pop(context);

    print("ENCODED POINTS:-");
    print(details.encodedPoints);


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


    myMapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 100));

    Marker pickUpLocMarker = Marker(
     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      //icon: this.widget.userLocationIcon,

      infoWindow: InfoWindow(title: initialPos.placeName,snippet: "My Location"),
      position: pickupLatlng,
      markerId: MarkerId("PickUpId"),
    );
    Marker dropOffLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: finalPos.placeName,snippet: "Destination"),
      position: dropoffLatlng,
      markerId: MarkerId("DropOffId"),
    );

    setState(() {
      markers.add(pickUpLocMarker);
      markers.add(dropOffLocMarker);
    });

    Circle pickUpLocCircle = Circle(
      fillColor: Colors.cyan.shade50,
      center: pickupLatlng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.cyanAccent,
      circleId: CircleId("PickUpId"),
    );
    Circle dropOffLocCircle = Circle(
      fillColor: Colors.red,
      center: pickupLatlng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.redAccent,
      circleId: CircleId("DropOffId"),
    );

    setState(() {
      circles.add(pickUpLocCircle);
      circles.add(dropOffLocCircle);
    });


  }

  void ResetHome(){

    setState(() {
      dropSet = false;
      polylineSet.clear();
      circles.clear();
      polylineCoordinates.clear();
      markers.clear();
      this.widget.searchDropOff = "Search Drop Off";
    });

    getCurrentPosition();

  }

  void calculateDistance(){

  }
}
