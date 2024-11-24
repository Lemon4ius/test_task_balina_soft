import 'package:shared_preferences/shared_preferences.dart';

class BaseDataStore{


  static final BaseDataStore _instance = BaseDataStore._init();
  late SharedPreferences _sharedPreferences;

  factory BaseDataStore(){
    return _instance;
  }

  BaseDataStore._init();

  initSharedPreferences() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  saveString(String key, String value){
    _sharedPreferences.setString(key, value);
  }
  saveBool(String key, bool value){
    _sharedPreferences.setBool(key, value);
  }
  saveListString(String key, List<String> value){
    _sharedPreferences.setStringList(key, value);
  }
  bool getBool(String key){
    return _sharedPreferences.getBool(key)??false;
  }
  String getString(String key){
    return _sharedPreferences.getString(key)?? '';
  }
  List<String> getListString(String key){
    return _sharedPreferences.getStringList(key)?? [];
  }

  clear(){
    _sharedPreferences.clear();
  }
}