import 'package:shared_preferences/shared_preferences.dart';

class CachHelper{
  static late SharedPreferences shard;
  static inti()async{
    shard=await SharedPreferences.getInstance();
  }
  static Future<bool> setData({
    required String key,
    required dynamic value,
  }){
    if(value is String) return shard.setString(key, value);
    if(value is int) return shard.setInt(key, value);
    if(value is bool) return shard.setBool(key, value);
    return shard.setDouble(key, value);
  }
  static dynamic  getData ({
    required String key,
  }){
    return shard.get(key);
  }
  static Future<bool> removeData({
    required String key,
  }){
   return shard.remove(key);
  }

}