import 'package:shared_preferences/shared_preferences.dart';
import 'package:maramstore/enum.dart';

class Shared {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void putString({required SharedKeys key, required String value}) {
    sharedPreferences?.setString(key.name, value);
  }

  static String getString({required SharedKeys key}) {
    return sharedPreferences?.getString(key.name) ?? "";
  }

  static void putBoolean({required SharedKeys key, required bool value}) {
    sharedPreferences?.setBool(key.name, value);
  }

  static bool getBoolean({required SharedKeys key}) {
    return sharedPreferences?.getBool(key.name) ?? false;
  }

  static void putInteger({required SharedKeys key, required int value}) {
    sharedPreferences?.setInt(key.name, value);
  }

  static int getInteger({required SharedKeys key}) {
    return sharedPreferences?.getInt(key.name) ?? 0;
  }

  static void putDouble({required SharedKeys key, required double value}) {
    sharedPreferences?.setDouble(key.name, value);
  }

  static double getDouble({required SharedKeys key}) {
    return sharedPreferences?.getDouble(key.name) ?? 0.0;
  }

  static void removeData({required SharedKeys key}) {
    sharedPreferences?.remove(key.name);
  }

  static void deleteData() {
    sharedPreferences?.clear();
  }
}
