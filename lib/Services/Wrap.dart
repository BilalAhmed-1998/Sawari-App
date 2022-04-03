import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sawari/Classes/User.dart';
import 'package:sawari/Screens/HomePage.dart';
import 'package:sawari/Screens/LoginPage.dart';

class Wrapp extends StatelessWidget {
  //const Wrap({Key? key}) : super(key: key);

  static const routeName = '/Wrapp';


  @override
  Widget build(BuildContext context) {
    ouruser user = Provider.of<ouruser>(context);

    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
