// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {




  static const routeName = '/VerifyPage';
  //const VerifyPage({Key? key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.cyan.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter SMS Code here: ",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "sawari",
            ),
            ),
            SizedBox(
              height: 10,
            ),
           SizedBox(
              width: width-20,
              child: TextField(
                controller: otpController,
                cursorColor: Colors.green,
                decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter OTP here',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle()),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sawari',
                  color: Colors.black87,
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
      ),

    );
  }
}

