//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static const routeName =  '/SignUpPage';
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  bool secure1 = true;
  bool secure2 = true;
  String chosenValue="Select Gender";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  TextEditingController ForName = TextEditingController();
  TextEditingController ForEmail = TextEditingController();
  TextEditingController ForPass = TextEditingController();
  TextEditingController ForGender = TextEditingController();
  //final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  /*void Register(BuildContext context)async{

    _firebaseAuth.createUserWithEmailAndPassword(email: ForEmail.text, password: pass.text);
    Map PassengerData={

      "name":ForName.text.trim(),
      "email":ForEmail.text.trim(),
    };

    DbReference.child("passengers").set(PassengerData);


  }*/

  /*void submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      return;
    }
    form.save();
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        child:Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        color: Colors.teal[50],
                        child: Image.asset('assets/images/circles.png')
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                ),

                const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color:Colors.black,
                      letterSpacing: 1.0,
                      fontSize: 24.0,

                    )
                ),

                const Padding(

                  padding: EdgeInsets.fromLTRB(30.0, 17.0, 30.0, 10.0),
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
                    controller: ForName,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      icon: Icon(Icons.person),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                      hintText: 'Enter your name',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                  ),

                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 23.0, 30.0, 0.0),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade100,
                        blurRadius: 100.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 10),
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
                    controller: ForEmail,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      icon: Icon(Icons.email, color:Colors.grey),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                      hintText: 'Enter your email address',


                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 23.0, 30.0, 0.0),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade100,
                        blurRadius: 100.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 10),
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
                  child:DropdownButtonFormField(

                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        icon: Icon(Icons.female, color:Colors.grey),
                        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                        hintText: 'Select your gender',


                      ),

                      value: chosenValue,
                      style: TextStyle(color: Colors.grey[700],fontSize: 16),
                      onChanged: (String newValue) {
                        setState(() {
                          chosenValue = newValue;
                        });
                      },
                      items: genders
                  ),


                ),


                const Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 23.0, 30.0, 0.0),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade100,
                        blurRadius: 100.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 10),
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

                    obscureText: secure1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        icon: const Icon(Icons.lock, color:Colors.grey),
                        contentPadding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                        hintText: 'Enter password',
                        suffixIcon: IconButton(
                            icon: Icon(
                                secure1 ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                secure1 = ! secure1;
                              });
                            })),

                    onFieldSubmitted: (password) {},
                    controller: pass,
                    validator: ( password) {
                      if (password==null) {
                        return "Enter at least 8 digit password";
                      } else if (password.length < 8) {
                        return "Password too short";
                      } else if (password.length > 32) {
                        return "Password too long";
                      } else
                        return null;
                    },

                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 23.0, 30.0, 0.0),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade100,
                        blurRadius: 100.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 10),
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
                      obscureText: secure2,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          icon: const Icon(Icons.lock, color:Colors.grey),
                          contentPadding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                          hintText: 'Confirm password',
                          hintStyle: TextStyle(color: Colors.grey[600]),

                          suffixIcon: IconButton(
                              icon: Icon(
                                  secure2 ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  secure2 = !secure2;
                                });
                              })

                      ),
                      onFieldSubmitted: (value) {},
                      controller: confirmPass,
                      validator:(value) {

                        if (value != pass.text)
                        {
                          return 'Password not matched';
                        }
                      }
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width/1.31,
                  height: MediaQuery.of(context).size.height / 15,
                  child:RaisedButton(
                    child: const Text('Register',
                      style: TextStyle(fontSize: 20, fontFamily: "assets/fonts/Poppins-Black.ttf"),
                    ),
                    color: Colors.cyan.shade600,
                    textColor: Colors.white,
                    elevation: 5,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {
                      //submit();
                      if (_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
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

List<DropdownMenuItem<String>> get genders{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Select Gender"),value: "Select Gender"),
    const DropdownMenuItem(child: Text("Male"),value: "Male"),
    const DropdownMenuItem(child: Text("Female"),value: "Female"),
    const DropdownMenuItem(child: Text("Other"),value: "Other"),
  ];
  return menuItems;
}
