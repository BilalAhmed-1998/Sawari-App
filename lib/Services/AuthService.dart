// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sawari/Screens/HomePage.dart';
import 'package:sawari/Screens/VerifyPage.dart';

import '../Classes/User.dart';


class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //PhoneAuthCredential credential;
  //String VerificationId;


  //// for stream provider package ////
  // ouruser userFromFirebaseUser( User us){
  //   return us!=null ? ouruser(uid: us.uid) : null;
  // }
  //
  // Stream <ouruser> get user {
  //   return auth.authStateChanges()
  //       .map((event) => userFromFirebaseUser(auth.currentUser));
  // }

  //sign in with phone


  void signInWithPhoneAuthCredential(PhoneAuthCredential credential) async{

     final authcred = await this.auth.signInWithCredential(credential);


  }


  // Future SignInWithPhone(context,String PhoneNo) async {
  //
  //   await auth.verifyPhoneNumber(
  //
  //       ////giving PhoneNO to firebase for verification!///
  //       phoneNumber: PhoneNo,
  //
  //       verificationCompleted: (PhoneAuthCredential) async {},
  //       verificationFailed: (FirebaseException) async {
  //         print("Verification Failed!");
  //       },
  //       codeSent: (verificationId, token) async {
  //         this.VerificationId = verificationId;
  //
  //
  //
  //
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) async {});
  //
  // }

  //sign out//

  Future SignOut() async{
   try{
      return await this.auth.signOut();

    } catch(e){
        print(e.toString());
        return null;

    }


  }



  // VerifyForm(context) {
  //   final otpController = TextEditingController();
  //   double width = MediaQuery.of(context).size.width;
  //   double height = MediaQuery.of(context).size.height;
  //   return Scaffold(
  //     backgroundColor: Colors.cyan.shade50,
  //     body: Container(
  //       margin: EdgeInsets.symmetric(horizontal: 20),
  //       color: Colors.cyan.shade50,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "Enter SMS Code here: ",
  //             style: TextStyle(
  //               fontSize: 22,
  //               fontWeight: FontWeight.bold,
  //               fontFamily: "sawari",
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           SizedBox(
  //             width: width - 20,
  //             child: TextField(
  //               controller: otpController,
  //               cursorColor: Colors.green,
  //               decoration: InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: 'Enter OTP ',
  //                   alignLabelWithHint: true,
  //                   labelStyle: TextStyle()),
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //                 fontFamily: 'sawari',
  //                 color: Colors.black87,
  //               ),
  //               keyboardType: TextInputType.phone,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           ElevatedButton(
  //               onPressed: () async {
  //                 this.credential = PhoneAuthProvider.credential(
  //                     verificationId: this.VerificationId,
  //                     smsCode: otpController.text);
  //
  //                 this.signInWithPhoneAuthCredential(credential);
  //                 print(auth.currentUser.uid);
  //
  //                 Navigator.pushNamed(context, HomePage.routeName);
  //
  //               },
  //               child: Text(
  //                 'Verify',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontSize: 16,
  //                     fontFamily: 'poppin',
  //                     fontWeight: FontWeight.bold),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                 primary: Colors.cyan.shade600,
  //                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 150),
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }




}

