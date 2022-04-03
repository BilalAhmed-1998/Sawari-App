import 'package:flutter/material.dart';
import 'package:sawari/Screens/VehiclePicturePage.dart';
import 'package:sawari/credentials.dart' as globals;


class NumberPlatePage extends StatefulWidget {
  static const routeName =  '/NumberPlatePage';
  @override
  NumberPlatePageState createState() => NumberPlatePageState();
}

class NumberPlatePageState extends State<NumberPlatePage> {
  final mycontroller1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Number Plate',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.cyan.shade600),
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
              const Text('Number Plate', style:TextStyle(fontSize: 18,color: Colors.black)),
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
                  controller: mycontroller1,

                  style: TextStyle(color: Colors.black),
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
                      return 'Please enter number';
                    }
                    return null;
                },
              ),
            ),
          ],
        ),
      ),

              const Padding(
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
                    globals.carPlate=mycontroller1.text;

                    print("FNAME: ");
                    print(globals.fName);
                    print("LNAME: ");
                    print(globals.lName);
                    print("DOB: ");
                    print(globals.dob);
                    print("Email: ");
                    print(globals.email);
                    print("LNO: ");
                    print(globals.lNo);
                    print("LExpiryDate: ");
                    print(globals.lExpiryDate);
                    print("CNo: ");
                    print(globals.cNo);
                    print("carMake: ");
                    print(globals.carMake);
                    print("carModel: ");
                    print(globals.carModel);
                    print("carYear: ");
                    print(globals.carYear);
                    print("carPlate: ");
                    print(globals.carPlate);

                    // submit();
                    if (_formKey.currentState.validate()) {
                      //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehiclePicturePage()));
                    }
                    else{
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NumberPlatePage()));
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