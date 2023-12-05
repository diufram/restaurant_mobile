import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  setUserToken(String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('user_token', value);
  }

  Future<String> getUserToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('user_token').toString();
  }

  removeToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('user_token');
  }
}
