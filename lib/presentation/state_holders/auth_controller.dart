import 'dart:convert';

import 'package:ecommerce_project/data/models/create_profile_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String accessToken = '';
  static const String _tokenKey = 'token';

  static Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey, token);
    accessToken = token;
  }

  static Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    accessToken = token ?? '';
    return accessToken;
  }

  static Future<bool> checkLoggedState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = await getToken();
    return token.isNotEmpty;
  }

  static Future<void> clearLoggedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    accessToken = '';
  }

  static Future<void> setUserData(CreateProfileModel createProfileModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        'createProfileModel', jsonEncode(createProfileModel.toJson()));
  }

  static Future<CreateProfileModel?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? profileData = sharedPreferences.getString('createProfileModel');
    if (profileData == null) {
      return null;
    }

    return CreateProfileModel.fromJson(jsonDecode(profileData));
  }
}
