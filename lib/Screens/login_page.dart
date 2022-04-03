// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class login_page extends StatefulWidget {
  static const routeName = '/login_page';

 // const login_page({Key key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double zarf_container_height = (height / 7) -18 ;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        color:  Colors.cyan.shade600,
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: zarf_container_height, horizontal: 0),
                  child: Container(
                    width: width/2,
                    child: Image(
                      image: AssetImage("assets/images/logoimage.png"),
                    ),
                  ),
                ),
                Container(
// padding: EdgeInsets.symmetric(vertical: 300,horizontal: 0.0),
                  alignment: Alignment.centerLeft,
                  height: height - zarf_container_height,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Container(
                        height: height / 8,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Log In',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'InterBold'),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Hey! Welcome back!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
//fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                            ]),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
//textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'InterBold'),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
//contentPadding: EdgeInsets.symmetric(horizontal: 0),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  hintText: 'example@gmail.com',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 80,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
//textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'InterBold'),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  hintText: 'adam123',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                child: TextButton(
                                  onPressed: () {
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          ]),
                      SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 8.5*(width/10),
                          child: ElevatedButton(
                              onPressed: () {
                              //  Navigator.pushNamed(context, home_page.routeName);
                              },
                              child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary:  Colors.cyan.shade600,
                                //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                              )
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "I don't have an account,",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                             // Navigator.pushNamed(context, schoollevel_page.routeName);

                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.cyan.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
