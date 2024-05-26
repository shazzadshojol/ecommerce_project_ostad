import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/presentation/screens/email_verify_screen.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    log(url.toString());
    try {
      final Response response = await get(Uri.parse(url));
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

  static void _moveToNextScreen() {
    getx.Get.to(() => const EmailVerifyScreen());
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    log(url.toString());
    try {
      final Response response = await post(Uri.parse(url),
          headers: {'accept': 'application/json'}, body: body);

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
