import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  static var PREFERENCE_ID = "PREFERENCE_ID";
  static var ISFIRSTTIME = "ISFIRSTTIME";
  static var ISLOGIN = "ISLOGIN";
  static var PREFERENCE_USER_ID ="PREFERENCE_USER_ID";
  static var PREFERENCE_TOKEN_ID ="PREFERENCE_TOKEN_ID";
  static var PREFERENCE_IS_LOGIN ="PREFERENCE_IS_LOGIN";
  static var PREFERENCE_USER_NAME="PREFERENCE_USER_NAME";
  static var PREFERENCE_IMAGE="PREFERENCE_IMAGE";
  static var PREFERENCE_USER_EMAIL="PREFERENCE_USER_EMAIL";
  static var PREFERENCE_USER_PHONE="PREFERENCE_USER_PHONE";


  static SharedPref instancee;

  static SharedPref getInstance()  {
    if(instancee == null){
      return  instancee = new SharedPref();
    }else{
      return instancee;
    }
  }

  SharedPreferences _preferences;
  setBoolean(String key,bool value) async {
    _preferences.setBool(key, value);
  }

  clear() async {
    _preferences.clear();
  }

  Future<bool> getBoolean(String key) async{
    _preferences = await SharedPreferences.getInstance();
    if(_preferences.get(key) == null){
      return false;
    }
    return  _preferences.getBool(key);

  }

  setString(String key,String value) async{
    _preferences = await SharedPreferences.getInstance();
    _preferences.setString(key, value);
  }

  Future<String> getString(String key) async {
    _preferences = await SharedPreferences.getInstance();

    return await _preferences.getString(key);

  }
}