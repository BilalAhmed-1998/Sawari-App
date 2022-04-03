import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sawari/Screens/VehicleInfoPage.dart';
import 'package:sawari/credentials.dart' as globals;


class DriverCNICPage extends StatefulWidget {
  static const routeName = '/DriverCNICPage';
  @override
  DriverCNICPageState createState() => DriverCNICPageState();
}

class DriverCNICPageState extends State<DriverCNICPage> {
  final _formKey = GlobalKey<FormState>();
  var myimage1;
  var myimage2;
  final mycontroller1 = TextEditingController();

  _imageCamera1() async {
    PickedFile picture = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);

    if (picture != null) {
      setState(() {
        myimage1 = File(picture.path);
      });
    }
  }

  _imageGallery1() async {
    PickedFile picture = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    if (picture != null) {
      setState(() {
        myimage1 = File(picture.path);
      });
    }
  }

  _imageCamera2() async {
    PickedFile picture = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);

    if (picture != null) {
      setState(() {
        myimage2 = File(picture.path);
      });
    }
  }

  _imageGallery2() async {
    PickedFile picture = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    if (picture != null) {
      setState(() {
        myimage2 = File(picture.path);
      });
    }
  }

  void _showPicker1(context) {
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
                        _imageGallery1();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imageCamera1();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPicker2(context) {
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
                        _imageGallery2();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imageCamera2();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('CNIC', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.cyan.shade600),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal[50],
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(18.0),
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
                  padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 7.0),
                  child: Column(
                    children: <Widget>[
                      const Text('Enter CNIC', style: TextStyle(fontSize: 18,color: Colors.black)),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal.shade100,
                              blurRadius: 100.0,
                              //offset: Offset(10, 10),
                            ),
                          ],
                        ),
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: mycontroller1,

                          style: TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your CNIC';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
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
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 2.0),
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                      ),
                      const Text('Front Side Picture',
                          style:
                              TextStyle(fontSize: 17, color: Colors.black87)),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _showPicker1(context);
                          },
                          child: myimage1 != null
                              ? ClipRRect(
                                  //borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    myimage1,
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.cyan.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 4.9,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                const Padding(
                  padding: EdgeInsets.all(5.0),
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
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 2.0),
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                      ),
                      const Text('Back Side Picture',
                          style:
                              TextStyle(fontSize: 17, color: Colors.black87)),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _showPicker2(context);
                          },
                          child: myimage2 != null
                              ? ClipRRect(
                                  //borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    myimage2,
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.cyan.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 4.9,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                  width: MediaQuery.of(context).size.width / 1.31,
                  height: MediaQuery.of(context).size.height / 15,
                  child: RaisedButton(
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "assets/fonts/Poppins-Black.ttf"),
                    ),
                    color: Colors.cyan.shade600,
                    textColor: Colors.white,
                    elevation: 5,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {

                      ///////////// gloabal variables ////////////////
                      globals.cNo=mycontroller1.text;
                      globals.cnicFrontPic = myimage1;
                      globals.cnicBackPic=myimage2;
                      /////////////////              /////////////////

                      if (_formKey.currentState.validate()) {
                        //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));
                        //}
                        // else{
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VehicleInfoPage()));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
