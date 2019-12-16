
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences prefs;
  //static Map<String, dynamic> sharedPreferences;
  static Map<String, Function> sharedPreferencesSetFunctions = {
    "b": prefs.setBool,
    "i": prefs.setInt,
    "d": prefs.setDouble,
    "s": prefs.setString,
  };

  static Map<String, List<dynamic>> sharedPreferencesGetFunctions = {
    "b": [prefs.getBool, true],
    "i": [prefs.getInt, 0],
    "d": [prefs.getDouble, 0.0],
    "s": [prefs.getString, ""],
  };

  static initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setSharedPreference(
      {String sharedPreferenceKey, dynamic sharedPreferenceValue}) async {
    await sharedPreferencesSetFunctions[sharedPreferenceKey[0]](
        sharedPreferenceKey, sharedPreferenceValue);
  }

  static dynamic getSharedPreference({String sharedPreferenceKey}) {
    var pref = sharedPreferencesGetFunctions[sharedPreferenceKey[0]][0](
            sharedPreferenceKey) ??
        sharedPreferencesGetFunctions[sharedPreferenceKey[0]][1];

    return pref;
  }
}
