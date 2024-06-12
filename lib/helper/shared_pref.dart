import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get variableName => _sharedPrefs.getString("key") ?? "";

  set variableName(String value) {
    _sharedPrefs.setString("key", value);
  }

  void delete() {
    _sharedPrefs.remove("key");
  }
}
