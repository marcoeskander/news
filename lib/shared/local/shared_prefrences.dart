import 'package:shared_preferences/shared_preferences.dart';

class shared_Prefrences {
  static late SharedPreferences sharedPreferences;

  static Init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> setdata({required key, value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static Future<bool> removedata({
    required String key,
  }) async {
    return await sharedPreferences.remove(
      key,
    );
  }
}
