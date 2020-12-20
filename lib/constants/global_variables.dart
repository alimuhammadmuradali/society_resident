import 'package:shared_preferences/shared_preferences.dart';
import 'package:society_resident/models/money_pool.dart';
import 'package:society_resident/models/user.dart';

User user = User(email: '');
SharedPreferences prefs;
Money_Pool moneypool = Money_Pool(0);
//final BASE_URL = "https://societymanagementpakistan.herokuapp.com";
final BASE_URL = "http://192.168.100.134:5000";