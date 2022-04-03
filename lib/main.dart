import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sawari/Screens/LoadingScreen.dart';
import 'package:sawari/Screens/LoginPage.dart';
import 'package:sawari/Screens/PassengerLogin.dart';
import 'package:sawari/Screens/SearchScreen.dart';
import 'package:sawari/Screens/SignUpPage.dart';
import 'package:sawari/Screens/SplashScreen.dart';
import 'package:sawari/Screens/WelcomePage.dart';
import 'package:sawari/Screens/RegisterPage.dart';
import 'package:sawari/Routes.dart';
import 'package:sawari/Screens/login_page.dart';
//import 'package:sawari/SignUp.dart';
import 'package:provider/provider.dart';
import 'package:sawari/Services/AuthService.dart';
import 'package:sawari/Services/DataChangesOverTime.dart';
import 'package:sawari/Services/Wrap.dart';

import 'Screens/HomePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => DataChangesOverTime(),
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
       // theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        routes: routes,
      // initialRoute: FirebaseAuth.instance.currentUser == null ? WelcomePage.routeName : HomePage.routeName,
       home: SplashScreen(duration: 1,goTopage: FirebaseAuth.instance.currentUser == null ? RegisterPage.routeName : HomePage.routeName,),
      ),
    );
  }
}



