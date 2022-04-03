import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sawari/Screens/DriverLicensePage.dart';
import 'package:sawari/credentials.dart' as globals;

import 'HomePage.dart';



class PassengerLogin extends StatefulWidget {


  static const routeName =  '/PassengerLogin';
  @override
  PassengerLoginState createState() => PassengerLoginState();
}

class PassengerLoginState extends State<PassengerLogin> {

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  /*void submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      return;
    }
    form.save();
  }*/

  TextEditingController enterdate = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  var myimage;
  //  driver d1;

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

  /*_imageGallery() async {
    //final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    File picture = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      myimage = picture;
    });
  }*/

  _imageGallery() async {
    PickedFile picture = await ImagePicker().getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    if (picture != null) {
      setState(() {
        myimage = File(picture.path);
        //print(myimage);
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

  void initState() {
    enterdate.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Profile',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.cyan.shade600),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),

      ),
      body: SingleChildScrollView(
        child:Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal[50],
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.cyan.shade600,
                      child: myimage != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          myimage,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                          : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  child: Text(
                    'Add a photo',

                    style: TextStyle(color: Colors.cyan.shade600, fontSize: 15),
                  ),
                  padding: const EdgeInsets.fromLTRB(41.0, 13.0, 15.0, 5.0),
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width/2.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.cyan.shade600, spreadRadius: 1),
                    ],
                  ),
                ),
                const Padding(

                  padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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

                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),

                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width/1.2,
                  child:TextFormField(
                    controller: myController1,
                    style: TextStyle(color: Colors.black),

                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                      hintText: 'First Name',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }



                      return null;
                    },
                  ),
                ),


                const Padding(

                  padding: EdgeInsets.fromLTRB(30.0, 7.0, 30.0, 10.0),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade100,
                        blurRadius: 100.0,

                      ),
                    ],
                    border: Border.all(
                      color: Colors.cyan.shade600,
                      width: 3,
                    ),
                  ),

                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),

                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width/1.2,
                  child:TextFormField(
                    controller: myController2,

                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                      hintText: 'Last Name',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(

                  padding: EdgeInsets.fromLTRB(30.0, 7.0, 30.0, 10.0),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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

                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),

                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width/1.2,
                  child:TextFormField(
                    controller: enterdate,

                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                      hintText: 'Date of Birth',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter DOB';
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () async {
                      DateTime pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101)
                      );

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          enterdate.text = formattedDate;
                        });
                      }
                      else {
                        print("Date is not selected");
                      }
                      keyboardType:TextInputType.text;
                      validator:(value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter DOB';
                        }
                        return null;
                      };
                    },
                  ),
                ),
                const Padding(

                  padding: EdgeInsets.fromLTRB(30.0, 7.0, 30.0, 10.0),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade100,
                        blurRadius: 100.0,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.cyan.shade600,
                      width: 3,
                    ),
                  ),

                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),

                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width/1.2,
                  child:TextFormField(
                    controller: myController4,

                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                      hintText: 'Email (optional)',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.text,

                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width/1.31,
                  height: MediaQuery.of(context).size.height / 15,
                  child:RaisedButton(
                    child: const Text('Next',
                      style: TextStyle(fontSize: 20, fontFamily: "assets/fonts/Poppins-Black.ttf"),
                    ),
                    color: Colors.cyan.shade600,
                    textColor: Colors.white,
                    elevation: 5,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {


                      globals.P_fName = myController1.text;
                      globals.P_lName = myController2.text;
                      globals.P_dob = enterdate.text;
                      globals.P_email = myController4.text;
                      globals.P_profilePic = myimage;


                      // submit();
                      if (_formKey.currentState.validate()) {
                        //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));
Navigator.pushNamed(context, HomePage.routeName) ;                     }

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