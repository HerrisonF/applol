import 'package:shared_preferences/shared_preferences.dart';

void storeStringList(String key, value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(key, value);
}

Future<List<String>> getStringList(String key) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(key);
}

void storeString(String key, String value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> getString(String key) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}