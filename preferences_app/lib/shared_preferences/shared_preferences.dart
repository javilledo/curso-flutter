import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static late SharedPreferences _preferences;

  static bool _isDarkMode = false;
  static int _gender = 1;
  static String _name = '';
  
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get name {
    return _preferences.getString('name') ?? _name;
  }

  static set name (String name) {
    _name = name;
    _preferences.setString('name', name);
  }

  static bool get isDarkMode {
    return _preferences.getBool('isDArkMode') ?? _isDarkMode;
  }

  static set isDarkMode (bool isDarkMode) {
    _isDarkMode = isDarkMode;
    _preferences.setBool('isDArkMode', isDarkMode);
  }

  static int get gender {
    return _preferences.getInt('gender') ?? _gender;
  }

  static set gender (int gender) {
    _gender = gender;
    _preferences.setInt('gender', gender);
  }
}