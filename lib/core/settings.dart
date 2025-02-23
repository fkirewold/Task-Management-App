import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static final String _userKey = 'userNameKey';

  static Future<String?> getUserName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_userKey);
  }
  static Future<void> setUserName(String name) async
  {
      final SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.setString(_userKey,name);
  }
}
