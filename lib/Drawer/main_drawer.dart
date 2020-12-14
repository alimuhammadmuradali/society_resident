import 'package:flutter/material.dart';
import 'package:society_resident/Drawer/my_complain.dart';
import 'package:society_resident/constants/global_variables.dart';
import 'package:society_resident/main.dart';
import 'package:toast/toast.dart';
import 'package:society_resident/Drawer/add_complain.dart';
import 'package:geolocator/geolocator.dart';
import 'package:society_resident/detail_screen/update_detail.dart';

class Main_Drawer extends StatelessWidget {

  var _latitude , _longitude;
//  LocationData _locationData;
//  Location _location;

  Position _currentPosition;
  String _currentAddress;

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  void _getCurrentLocation()async{
    final location = await Geolocator().getCurrentPosition();
    print(location.latitude);
    print(location.longitude);
    print(location.accuracy);
  }

  @override
  void initState(){
    _getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            color: Colors.black,
            child: Center(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // print("Container was tapped");
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  new update_Details()));
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:NetworkImage('https://1z1euk35x7oy36s8we4dr6lo-wpengine.netdna-ssl.com/wp-content/uploads/2019/11/numze-e1572781662446.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  Text(user.name ,style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              "Add Complain",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  new add_complain()));
            },
          ),
          ListTile(
            leading: Icon(Icons.all_out),
            title: Text(
              "My Complains",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  new myComplain()));
            },
          ),

          ListTile(
            leading: Icon(Icons.all_out),
            title: Text(
              "Alert A Crime",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: (){
              _getCurrentLocation();
              Navigator.pop(context);
              Toast.show("Location sent to guard", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            },
          ),
          ListTile(
            leading: Icon(Icons.all_out),
            title: Text(
              "Sign Out",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: (){
              prefs.remove('email');
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage()));
            },
          ),
        ],
      ),
    );
  }
}