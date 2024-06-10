import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/presentation/screens/email_verify_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(
      {required String url, bool fromAuth = false}) async {
    log(url.toString());
    log(AuthController.accessToken.toString());

    try {
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'token': AuthController.accessToken
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);

        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else if (response.statusCode == 401) {
        if (fromAuth = true) {
          _moveToNextScreen();
        }
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      log(e.toString());
      return NetworkResponse(
          responseCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }

  static void _moveToNextScreen() async {
    await AuthController.clearUserData();
    getx.Get.to(() => const EmailVerifyScreen());
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    log(url.toString());
    log(AuthController.accessToken.toString());
    try {
      final Response response = await post(Uri.parse(url),
          headers: {
            'accept': 'application/json',
            'token': AuthController.accessToken
          },
          body: jsonEncode(body));

      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);

        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else if (response.statusCode == 401) {
        _moveToNextScreen();
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      log(e.toString());
      return NetworkResponse(
          responseCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }
}
