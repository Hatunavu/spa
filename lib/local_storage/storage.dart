import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  late SharedPreferences prefs;
  Future read(String key) async {
    prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }

  Future<void> save(String key, value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> remove(String key) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
