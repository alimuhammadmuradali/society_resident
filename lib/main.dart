import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:society_resident/constants/global_variables.dart';
import 'package:society_resident/home_screens/home_screens.dart';
import 'package:society_resident/setup_screens/login.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SplashScreenPage(),
    );
  }
}



class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds:  MyHomePage(),
      title: new Text('Resident Screen',textScaleFactor: 2.2,),
      image: new Image.asset('images/resident.png'),
      loadingText: Text("Loading"),
      photoSize: 170.0,
      loaderColor: Colors.black,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  var email;

  Widget build(BuildContext context) {
    email = prefs.getString('email');
    return Scaffold(
      body: email == null ? new LoginScreen() :homeScreen(),
    );
  }
}