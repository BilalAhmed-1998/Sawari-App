// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sawari/Classes/Address.dart';
import 'package:sawari/Classes/PlacePredictions.dart';
import 'package:sawari/Classes/User.dart';
import 'package:sawari/Screens/LoadingScreen.dart';
import 'package:sawari/Services/DataChangesOverTime.dart';
import 'package:sawari/Services/httpMethods.dart';
import 'package:sawari/Services/httpRequest.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/SearchScreen';
  String pickUpAddress;
  TextEditingController pickUplocationController = TextEditingController();

  SearchScreen({this.pickUpAddress}) {
    pickUplocationController.text = pickUpAddress;
  }
  //const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool pickUp = false;
  TextEditingController dropOfflocationController = TextEditingController();
  List<PlacePredictions> placePredictionList = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.cyan.shade50,
        centerTitle: true,
        title: Text(
          "Set drop off",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "sawari",
          ),
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 140,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.cyan.shade50,
                  // borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          // BoxShadow(
                          //   color: Colors.grey,
                          //   offset: Offset(0.0, 1.0), //(x,y)
                          //   blurRadius: 6.0,
                          // ),
                        ],
                      ),
                      height: 50,
                      child: CupertinoSearchTextField(
                        onChanged: (val) {
                          setState(() {
                            this.pickUp = true;
                          });
                          findPlace(val);
                        },
                        controller: widget.pickUplocationController,
                        placeholder: "PickUp Location",
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Colors.cyan,
                        ),
                        placeholderStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                          fontFamily: "Inter",
                        ),
                        backgroundColor: Colors.white,
                        itemColor: Color(0xffD1D5DB),
                        itemSize: 30,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      height: 50,
                      child: CupertinoSearchTextField(
                        onChanged: (string) {
                          setState(() {
                            this.pickUp = false;
                          });
                          findPlace(string);
                        },
                        //autofocus: true,
                        controller: dropOfflocationController,
                        placeholder: "Drop Off Location",
                        prefixIcon: Icon(
                          Icons.add_location_alt,
                          color: Colors.cyan,
                        ),
                        placeholderStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                          fontFamily: "Inter",
                        ),
                        backgroundColor: Colors.white,
                        itemColor: Color(0xffD1D5DB),
                        itemSize: 30,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              (placePredictionList.isNotEmpty)
                  ? Flexible(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          for (var i = 0;
                              i < this.placePredictionList.length;
                              i++)
                            InkWell(
                              enableFeedback: true,
                              onTap: () {
                                pickDropPlaceDetails(
                                    placePredictionList[i].place_id, context);

                                // if (this.pickUp == false){
                                //   dropPlaceDetails(placePredictionList[i].place_id, context);
                                // }else{
                                //   pickPlaceDetails(placePredictionList[i].place_id, context);
                                // }
                              },
                              child: Container(
                                // height: 60,
                                color: Colors.white,
                                // padding: EdgeInsets.symmetric(vertical: 5),
                                width: width,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Row(children: [
                                        CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Colors.cyan,
                                          child: Icon(
                                            Icons.location_on,
                                            size: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: width - 100,
                                                child: Text(
                                                  placePredictionList[i]
                                                      .main_text,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      fontFamily: "Inter"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Container(
                                                width: width - 100,
                                                child: Text(
                                                  this
                                                      .placePredictionList[i]
                                                      .secondary_text,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      fontFamily: "Inter"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ),
                                    SizedBox(
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.cyan,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ]),
                      ),
                    )
                  : Container()
              // ? Flexible(
              //
              //   child: ListView.separated(
              //       itemCount: placePredictionList.length,
              //     itemBuilder: (context,index){
              //     return placesListTile(placePredictions: placePredictionList[index],pickUp: pickUp,);
              //   },
              //       separatorBuilder: (BuildContext context ,int index) => Divider(thickness: 1,color: Colors.cyan,),
              //   ),
              //
              // )
              //     :Container(),

              // Divider(thickness: 1,color: Colors.cyan,),
            ],
          )),
    );
  }
  void findPlace(String placeName) async {
    if (placeName.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI&components=country:pk";

      var placesResult = await httpRequest.getRequest(autoCompleteUrl);

      if (placesResult == null) {
        return;
      }

      if (placesResult["status"] == "OK") {
        var predictions = placesResult["predictions"];
        var placesList = (predictions as List)
            .map((e) => PlacePredictions.fromJson(e))
            .toList();

        // print("res: \n ");
        // print(placesList);
        setState(() {
          this.placePredictionList = placesList;
        });
      }
    }
  }
  void pickDropPlaceDetails(String placeId, context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) => LoadingScreen(
              msg: "Requesting Location...",
            ));

    String placeDetailUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI";

    var placeDetailResult = await httpRequest.getRequest(placeDetailUrl);

    Navigator.pop(context);

    if (placeDetailResult == "failed") {
      return;
    }

    if (placeDetailResult["status"] == "OK") {
      Address pickAddress = Address();
      pickAddress.placeId = placeId;
      pickAddress.placeName = placeDetailResult["result"]["name"];
      pickAddress.longitude =
          placeDetailResult["result"]["geometry"]["location"]["lng"];
      pickAddress.latitude =
          placeDetailResult["result"]["geometry"]["location"]["lat"];

      if (this.pickUp == true) {
        Provider.of<DataChangesOverTime>(context, listen: false)
            .updatePickUpLocationAddress(pickAddress);
        this.widget.pickUplocationController.text =
            Provider.of<DataChangesOverTime>(context, listen: false)
                .pickupLocation
                .placeName;
      } else {
        Provider.of<DataChangesOverTime>(context, listen: false)
            .updateDropOffLocationAddress(pickAddress);
        Navigator.pop(context, pickAddress.placeName);
      }
    }
  }
}

// class placesListTile extends StatelessWidget {
//  // const placesListTile({Key? key}) : super(key: key);
//
//   PlacePredictions placePredictions;
//   bool pickUp;
//
//   placesListTile({this.placePredictions,this.pickUp});
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return
//       InkWell(
//       enableFeedback: true,
//       onTap: (){
//         if (this.pickUp == false){
//           dropPlaceDetails(placePredictions.place_id, context);
//         }else{
//           pickPlaceDetails(placePredictions.place_id, context);
//         }
//
//       },
//       child: Container(
//         // height: 60,
//         color: Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//         width: width,
//         child: Row(
//             children:[
//               CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.cyan,
//                 child: Icon(
//                   Icons.location_on,
//                   size: 22,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(width: 10,),
//               Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: width-100,
//                       child: Text(this.placePredictions.main_text,
//                         overflow: TextOverflow.visible,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             fontFamily: "Inter"
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7,),
//                     Container(
//                       width: width-100,
//                       child: Text(this.placePredictions.secondary_text,
//                         overflow: TextOverflow.visible,
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                             fontFamily: "Inter"
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//
//             ] ),
//       ),
//     );
//   }
//
//
//   void dropPlaceDetails (String placeId,context)async{
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => CircularProgressIndicator(color: Colors.cyan,)
//     );
//
//
//     String placeDetailUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI";
//
//     var placeDetailResult = await httpRequest.getRequest(placeDetailUrl);
//
//     Navigator.pop(context);
//
//     if(placeDetailResult == "failed")
//       {
//         return;
//       }
//
//     if(placeDetailResult["status"] == "OK"){
//
//       Address dropAddress = Address();
//       dropAddress.placeId = placeId;
//       dropAddress.placeName = placeDetailResult["result"]["name"];
//       dropAddress.longitude = placeDetailResult["result"]["geometry"]["location"]["lng"];
//       dropAddress.latitude = placeDetailResult["result"]["geometry"]["location"]["lat"];
//
//       Provider.of<DataChangesOverTime>(context,listen: false).updateDropOffLocationAddress(dropAddress);
//
//       Navigator.pop(context,dropAddress.placeName);
//     }
//
//
//   }
//   void pickPlaceDetails (String placeId,context)async{
//
//     showDialog(
//         context: context,
//         builder: (BuildContext context) => CircularProgressIndicator(color: Colors.cyan,)
//     );
//
//
//     String placeDetailUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI";
//
//     var placeDetailResult = await httpRequest.getRequest(placeDetailUrl);
//
//     Navigator.pop(context);
//
//     if(placeDetailResult == "failed")
//     {
//       return;
//     }
//
//     if(placeDetailResult["status"] == "OK"){
//
//       Address pickAddress = Address();
//       pickAddress.placeId = placeId;
//       pickAddress.placeName = placeDetailResult["result"]["name"];
//       pickAddress.longitude = placeDetailResult["result"]["geometry"]["location"]["lng"];
//       pickAddress.latitude = placeDetailResult["result"]["geometry"]["location"]["lat"];
//
//       Provider.of<DataChangesOverTime>(context,listen: false).updatePickUpLocationAddress(pickAddress);
//
//       //Navigator.pop(context,pickAddress.placeName);
//     }
//
//
//   }
//
// }

// void dropPlaceDetails (String placeId,context)async{
//   showDialog(
//       context: context,
//       builder: (BuildContext context) => LoadingScreen(msg: "Requesting DropOff...",)
//   );
//
//   String placeDetailUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI";
//
//   var placeDetailResult = await httpRequest.getRequest(placeDetailUrl);
//
//   Navigator.pop(context);
//
//   if(placeDetailResult == "failed")
//   {
//     return;
//   }
//
//   if(placeDetailResult["status"] == "OK"){
//
//     Address dropAddress = Address();
//     dropAddress.placeId = placeId;
//     dropAddress.placeName = placeDetailResult["result"]["name"];
//     dropAddress.longitude = placeDetailResult["result"]["geometry"]["location"]["lng"];
//     dropAddress.latitude = placeDetailResult["result"]["geometry"]["location"]["lat"];
//
//     Provider.of<DataChangesOverTime>(context,listen: false).updateDropOffLocationAddress(dropAddress);
//
//     Navigator.pop(context,dropAddress.placeName);
//   }
//
//
// }
// void pickPlaceDetails (String placeId,context)async{
//
//   showDialog(
//       context: context,
//       builder: (BuildContext context) => LoadingScreen(msg: "Requesting PickUp...",)
//   );
//
//
//   String placeDetailUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyBfpCULggQtjCjnhGowPo0PLHbMCTAdWmI";
//
//   var placeDetailResult = await httpRequest.getRequest(placeDetailUrl);
//
//   Navigator.pop(context);
//
//   if(placeDetailResult == "failed")
//   {
//     return;
//   }
//
//   if(placeDetailResult["status"] == "OK"){
//
//     Address pickAddress = Address();
//     pickAddress.placeId = placeId;
//     pickAddress.placeName = placeDetailResult["result"]["name"];
//     pickAddress.longitude = placeDetailResult["result"]["geometry"]["location"]["lng"];
//     pickAddress.latitude = placeDetailResult["result"]["geometry"]["location"]["lat"];
//
//     Provider.of<DataChangesOverTime>(context,listen: false).updatePickUpLocationAddress(pickAddress);
//     this.widget.pickUplocationController.text = Provider.of<DataChangesOverTime>(context,listen: false).pickupLocation.placeName;
//
//     //Navigator.pop(context,pickAddress.placeName);
//   }
//
//
// }
