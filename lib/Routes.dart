
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sawari/Screens/HomePage.dart';
import 'package:sawari/Screens/LoadingScreen.dart';
import 'package:sawari/Screens/RegisterPage.dart';
import 'package:sawari/Screens/LoginPage.dart';
import 'package:sawari/Screens/SearchScreen.dart';
import 'package:sawari/Screens/SplashScreen.dart';
import 'package:sawari/Screens/WelcomePage.dart';
import 'package:sawari/Screens/driver_homepage.dart';
import 'package:sawari/Screens/login_page.dart';
import 'package:sawari/Services/Wrap.dart';
//import 'package:sawari/SignUp.dart';

import 'Screens/DriverCNICPage.dart';
import 'Screens/DriverLicensePage.dart';
import 'Screens/DriverProfilePage.dart';
import 'Screens/DriverRegPage.dart';
import 'Screens/DriverTransportPage.dart';
import 'Screens/NumberPlatePage.dart';
import 'Screens/PassengerLogin.dart';
import 'Screens/VehicleCertificatePage.dart';
import 'Screens/VehicleInfoPage.dart';
import 'Screens/VehiclePicturePage.dart';
import 'Screens/VerifyPage.dart';




final Map <String,WidgetBuilder> routes =  {

 // SplashScreen.routeName: (context) => SplashScreen(duration: 1,goTopage: Wrapp.routeName),
  //login_page.routeName: (context) => login_page(),

  SearchScreen.routeName: (context) => SearchScreen(),
  Wrapp.routeName: (context) => Wrapp(),
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  WelcomePage.routeName: (context) => WelcomePage(),
  VerifyPage.routeName: (context) => VerifyPage(),
  HomePage.routeName: (context) => HomePage(),
  LoadingScreen.routeName: (context) => LoadingScreen(msg: "Loading Please Wait..."),
  //SignUp.routeName: (context) => SignUp(),
  DriverRegPage.routeName: (context) => DriverRegPage(),
  DriverProfilePage.routeName: (context) => DriverProfilePage(),
  DriverLicensePage.routeName: (context) => DriverLicensePage(),
  DriverCNICPage.routeName: (context) => DriverCNICPage(),
  VehicleInfoPage.routeName: (context) => VehicleInfoPage(),
  DriverTransportPage.routeName: (context) => DriverTransportPage(),
  NumberPlatePage.routeName: (context) => NumberPlatePage(),
  VehiclePicturePage.routeName: (context) => VehiclePicturePage(),
  VehicleCertificatePage.routeName: (context) => VehicleCertificatePage(),
  driver_homepage.routeName:(context) => driver_homepage(),
  PassengerLogin.routeName:(context) => PassengerLogin(),


};