// ignore_for_file: prefer_const_constructors

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sawari/Screens/HomePage.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sawari/Screens/LoadingScreen.dart';
import 'package:sawari/Screens/VerifyPage.dart';
import 'package:sawari/Screens/WelcomePage.dart';
import 'package:sawari/Services/AuthService.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  String verificationId;
  bool currentState = false;
  PhoneAuthCredential authCredential;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  bool showloading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  signInWithPhoneAuthCredential(PhoneAuthCredential credential) async {
    setState(() {
      showloading = true;
    });

    try {
      await auth.signInWithCredential(credential);

      if (FirebaseAuth.instance.currentUser != null) {

        // ignore: unrelated_type_equality_checks
        if(_determinePosition() != null)
        {
          Navigator.pushNamed(context, HomePage.routeName);
        }
        else{

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Please Turn On the location Services")));

        }

      }
      // setState(() {
      //   showloading = false;
      // });
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }

    // setState(() {
    //   showloading = false;
    // });

  }

  LoginForm(context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 120, 10),
            child: Text(
              'Enter Your Phone Number: ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontFamily: 'poppin',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 20.0),
                child: CountryCodePicker(
                  initialSelection: 'PK',
                  padding: EdgeInsets.zero,
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'sawari',
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                width: 280,
                child: TextField(
                  controller: phoneController,
                  cursorColor: Colors.green,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter phone number',
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                        color: Colors.black
                      )),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sawari',
                    color: Colors.black87,
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ], // children
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  showloading = true;
                });

                await auth.verifyPhoneNumber(

                    ////giving PhoneNO to firebase for verification!///
                    phoneNumber: "+92" + phoneController.text,
                    verificationCompleted: (PhoneAuthCredential) async {
                      setState(() {
                        showloading = false;
                      });
                    },
                    verificationFailed: (FirebaseException) async {
                      setState(() {
                        showloading = false;
                      });
                      // _scafkey.currentState.showSnackBar(snackbar)
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(FirebaseException.message),
                      ));
                    },
                    codeSent: (verificationId, token) async {
                      setState(() {
                        showloading = false;
                        this.widget.currentState = true;
                        this.widget.verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) async {});
              },
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'poppin',
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade600,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 150),
              )),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }


  VerifyForm(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.cyan.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter SMS Code here: ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "sawari",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width - 20,
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                //fieldWidth: 30,
                onCompleted: (pin) {
                  // setState(() {
                  //   showloading = true;
                  // });
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: this.widget.verificationId, smsCode: pin);
                  signInWithPhoneAuthCredential(credential);
                },
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sawari',
                  color: Colors.black87,
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (FirebaseAuth.instance.currentUser != null) {
                    Navigator.pushNamed(context, HomePage.routeName);
                  }
                },
                child: Text(
                  'Verify',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'poppin',
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade600,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                )),
          ],
        ),
      ),
    );
  }

  Future<bool> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Location services are disabled.'),
      ));

      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Location permissions are denied'),
        ));

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Location permissions are permanently denied, we cannot request permissions.'),
      ));

      return false;
    }

    return true;
  }

  final GlobalKey<ScaffoldState> _scafkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (!showloading) {
      if (!this.widget.currentState) {
        return LoginForm(context);
      } else {
        return VerifyForm(context);
      }
    } else {

      return  LoadingScreen(msg: "Loading Please Wait...",);
    }
  }
}
