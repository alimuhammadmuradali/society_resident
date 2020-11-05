

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
//import 'package:society_resident/constants/ui_constants.dart';


class google_map extends StatefulWidget {
  @override
  _google_mapState createState() => _google_mapState();
}

class _google_mapState extends State<google_map> {
  GoogleMapController _googleMapController;
  String SearchAddress;
  BitmapDescriptor customIcon;
  Set<Marker> Markers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Markers = Set.from([]);
  }
  var addresses ;
  bool mapSelected = false;
  double lat , lang;

  void getAdress(latitude , longitude) async
  {
    final coordinates = new Coordinates(latitude, longitude);
    lat = latitude;
    lang = longitude;
    debugPrint('coordinates is: $coordinates');
    addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print(addresses.first.addressLine);
    mapSelected = true;
  }

  createMarker(context)
  {
    if(customIcon ==null)
      {
        ImageConfiguration configuration = createLocalImageConfiguration(context);
        BitmapDescriptor.fromAssetImage(configuration, 'images/google_marker.png').then((value){
        customIcon = value;
        });
      }
  }
  var address;

  @override
  Widget build(BuildContext context) {
    createMarker(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,
            markers: Markers,
            onTap: (pos){

              setState(() {
                print(pos);
              Marker m = Marker(markerId: MarkerId('1'), icon: customIcon, position: pos,);
                Markers.add(m);
                getAdress(pos.latitude , pos.longitude);
              });
            },
            scrollGesturesEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat ?? 27.2048,lang ??77.4975),
              zoom: 10.0,
            ),
          ),
          Positioned(
            top: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                decoration:InputDecoration(
                  hintText: 'Enter Address',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 30.0,
                  ),
                ) ,
                onChanged: (val){
                  setState(() {
                    SearchAddress = val;
                    print(val);
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 90.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 100.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child:mapSelected? Center(child: Text(addresses.first.addressLine)): Center(child: Text("Your Address")),
            ),
          ),
        ],
      ),
    );
  }



  void onMapCreated(controller)
  {
    setState(() {
      _googleMapController = controller;
    });
  }
}
