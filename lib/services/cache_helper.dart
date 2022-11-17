import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/responses/login_response.dart';

class CacheHelper{
  SharedPreferences? prefs = null;
  // CacheHelper cacheHelper = CacheHelper();

   openCache() async {
    prefs = await SharedPreferences.getInstance();
  }

  /*
   * caches any string and key
   */
  void saveAnyStringToCache(String value,String key) async {
    await openCache();
    // check if the key even exists
    prefs!.setString(key,value);
  }

  // void userDetailsToCache(String value,String key) async {
  //   await openCache();
  //   // check if the key even exists
  //   prefs!.setString(key,value);
  // }
  //
  // // checks shared preferences and fetches the user data saved there
  // Future getUserDetailsCached(String key, String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // cacheHelper.saveAnyStringToCache(value, key);
  //   cacheHelper.saveAnyStringToCache(value, key);
  //   String? values = prefs.getString(key);
  //   return values;
  // }

  /*
  * sets user login status to true
  */
  Future<void> loginUser(SignInResponse user) async {
    await openCache();
    prefs!.setBool('IS_USER_LOGGED_IN', true);
    bool? loginStatus = prefs!.getBool("IS_USER_LOGGED_IN");
    print("login status:" + loginStatus.toString());
    prefs!.setString('LOGGED_IN_USER', json.encode(user));
    print("login cached:" + json.encode(user));
  }


  /*
  * returns the users login status
  */
  Future<bool?> isLoggedIn() async {
    await openCache();
    // check if the key even exists
    bool checkValue = prefs!.containsKey("IS_USER_LOGGED_IN");

    if (checkValue) {
      bool? loginStatus = prefs!.getBool("IS_USER_LOGGED_IN");
      print("isLoggedIn:" + loginStatus.toString());
      return loginStatus;
    } else {
      return false;
    }
  }

  // checks shared preferences and fetches the user data saved there
  Future<String?> getSessionValue(String key) async {
    await openCache();
    String? value = prefs!.getString(key);
    //print("session status get:" + value);
    return value;
  }

  // checks shared preferences and fetches the user data saved there
  Future<SignInResponse> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString("LOGGED_IN_USER");
    var data = json.decode(userJson!);
    print("getCurrentUser:" + userJson);
    SignInResponse user = SignInResponse.fromJson(data);
    return user;
  }

  Future<bool> signOut() async {
    await openCache();
    prefs!.clear();
    return (prefs!.containsKey("LOGGED_IN_USER") || prefs!.containsKey("CHECK_LOGIN_STATUS"));
  }

}