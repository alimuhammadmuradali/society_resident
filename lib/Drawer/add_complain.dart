import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:society_resident/home_screens/complain_management_screen.dart';
import 'package:society_resident/home_screens/home_screens.dart';
import 'package:toast/toast.dart';

class add_complain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.black, Colors.black])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Add Complain",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8),
                  //   child: Text(
                  //     "Write your complain",
                  //     style: TextStyle(color: Colors.white, fontSize: 18),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: complainForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class complainForm extends StatefulWidget {
  @override
  _complainFormState createState() => _complainFormState();
}

class _complainFormState extends State<complainForm> {


  TextEditingController _complain = TextEditingController();
  bool complainProvided = false;
  String complainErrorText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: 10.0,
                right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: Text("Enter your Complain",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
//                text_input(
//                    'Enter Resident\'s Full Name', Icons.contact_mail, false),
                TextField(
                  maxLines: 6,
                  controller: _complain,
                  decoration: InputDecoration(
                    hintText: 'write your Complain..',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,

                    ),
                    errorText: (complainProvided)?null:complainErrorText,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15))),
                  ),
                  onTap: () {},

                  onChanged: (complain) {
                    setState((){

                      if (complain.isEmpty) {
                        complainErrorText='*complain is must';
                        complainProvided=false;
                      }

                      else {
                        complainErrorText= null;
                        complainProvided= true;
                      }

                    });

                  },
                  obscureText: false,
                ),


                SizedBox(
                  height: 27.0,
                ),
                Container(
                  height: 50.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    color: Colors.black,
                    elevation: 7.0,
                    child: MaterialButton(
                      onPressed: () {


                        if( complainProvided  ){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => complainManagement()));
                          Toast.show("Complain Added", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);


                          setState(() {
                            _complain.clear();
                            complainProvided=false;
                          });
                        }
                        else{
                          Toast.show("Complain Missing", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);

                      }
                        },
                      child: Center(
                        child: Text(
                          'Add Complain',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
