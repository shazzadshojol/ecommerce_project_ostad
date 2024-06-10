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
    String token = await getToken();
    return token.isNotEmpty;
  }

  static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = '';
  }

  static Future setUserData(CreateProfileModel createProfileModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print('Saving user data: ${jsonEncode(createProfileModel.toJson())}');
    bool isSaved = await sharedPreferences.setString(
        'createProfileModel', jsonEncode(createProfileModel.toJson()));
    print('User data saved: $isSaved');
    return isSaved;
  }

  static Future<CreateProfileModel?> getUserData(
      CreateProfileModel createProfileModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? profileData = sharedPreferences.getString('createProfileModel');
    print('Retrieved user data: $profileData');
    if (profileData == null) {
      print('No user data found in getUserData');
      return null;
    }

    return CreateProfileModel.fromJson(jsonDecode(profileData));
  }
}
