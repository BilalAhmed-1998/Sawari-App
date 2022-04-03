import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sawari/Screens/VehicleCertificatePage.dart';
import 'package:sawari/Screens/driver_homepage.dart';
import 'package:sawari/credentials.dart' as globals;



class VehicleCertificatePage extends StatefulWidget {
  static const routeName =  '/VehicleCertificatePage';
  @override
  VehicleCertificatePageState createState() =>VehicleCertificatePageState();
}

class VehicleCertificatePageState extends State<VehicleCertificatePage> {

  var myimage;
  TextEditingController enterdate = TextEditingController();

  _imageCamera() async {
    PickedFile picture = await ImagePicker().getImage(
        source: ImageSource.camera, imageQuality: 50
    );

    if (picture != null) {
      setState(() {
        myimage = File(picture.path);
      });
    }
  }

  _imageGallery() async {
    PickedFile picture = await ImagePicker().getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    if (picture != null) {
      setState(() {
        myimage = File(picture.path);
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Choose from library'),
                      onTap: () {
                        _imageGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Vehicle Certification',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.cyan.shade600),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),

      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[50],
          child: Column(
            children: <Widget>[

              const Padding(
                padding: EdgeInsets.all(37.0),
              ),


              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Colors.cyan.shade600,
                    width: 3,
                  ),
                ),

                padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 5.0),
                height: MediaQuery.of(context).size.height / 2.8,
                width: MediaQuery.of(context).size.width/1.1,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                    const Text('Vehicle Certificate Picture', style:TextStyle(fontSize: 17, color: Colors.black87)),
                    const Padding(
                      padding: EdgeInsets.all(13.0),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: myimage != null
                            ? ClipRRect(
                          //borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            myimage,
                            width: MediaQuery.of(context).size.width/1,
                            height: MediaQuery.of(context).size.height /5,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                            :Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan.shade100,
                            borderRadius: BorderRadius.circular(20),

                          ),
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width/1.2,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
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
                    // submit();
                    // if (_formKey.currentState!.validate()) {
                    //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehicleCertificatePage()));
                    //}
                    globals.vehicleCertificatePic = myimage;
                    globals.regDone=true;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>driver_homepage()));

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