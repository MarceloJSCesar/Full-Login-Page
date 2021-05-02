import 'package:shared_preferences/shared_preferences.dart';
import '../../interfaces/login/switch_button_interface.dart';

class SwitchButtonServices extends ISwitchButton {
  @override
  Future<bool> getK(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.get(key);
    if (isDark == null) {
      return false;
    } else {
      return isDark;
    }
  }

  @override
  Future delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future put(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
