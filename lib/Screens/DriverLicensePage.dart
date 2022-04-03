import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sawari/Screens/DriverCNICPage.dart';
import 'package:sawari/credentials.dart' as globals;



class DriverLicensePage extends StatefulWidget {
  static const routeName =  '/DriverLicensePage';
  @override
  DriverLicensePageState createState() => DriverLicensePageState();
}

class DriverLicensePageState extends State<DriverLicensePage> {


  final _formKey = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  /*void submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      return;
    }
    form.save();
  }*/
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

 /* _imageGallery() async {
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
        title: const Text('Driver License',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.cyan.shade600),
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
                padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 7.0),
                child: Column(
                    children: <Widget>[
                      const Text('Driver License Number', style:TextStyle(fontSize: 18,color: Colors.black)),
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

                        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),

                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width/1.2,
                        child:TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: myController1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),

                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter license number';
                            }
                            return null;
                          },
                        ),
                      ),
                ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(10.0),
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
                        const Text('Expiration Date', style:TextStyle(fontSize: 18,color: Colors.black)),
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

                              ),
                            ],
                          ),

                          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),

                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width/1.2,
                          child:TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: enterdate,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                              suffixIcon: Icon(Icons.calendar_today),

                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter expiration date';
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
                                  return 'Please enter expiration date';
                                }
                                return null;
                              };
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
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
                    width: MediaQuery.of(context).size.width/1.1,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(3.0),
                ),
                const Text('Add license picture for verification', style:TextStyle(fontSize: 17, color: Colors.black87)),
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
                      child: const Text('Next',
                        style: TextStyle(fontSize: 20, fontFamily: "assets/fonts/Poppins-Black.ttf"),
                      ),
                      color: Colors.cyan.shade600,
                      textColor: Colors.white,
                      elevation: 5,
                      padding: const EdgeInsets.all(10),
                      onPressed: () {

                        globals.lNo = myController1.text;
                        globals.lExpiryDate = enterdate.text;
                        globals.licensePic =myimage;

                        // submit();
                        if (_formKey.currentState.validate()) {
                          //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriverCNICPage()));
                        }
                        else{
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriverLicensePage()));
                        }
                        // else
                        // {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriverLicense()));
                        //}
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