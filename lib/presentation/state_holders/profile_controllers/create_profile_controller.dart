import 'dart:developer';

import 'package:ecommerce_project/data/models/create_profile_data_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:ecommerce_project/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart%20';

class CreateProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = 'Profile Updating Failed';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> saveUserDetails(CreateProfileModel createProfileModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createProfile,
      body: createProfileModel.toJson(),
    );

    log('Data sent: ${createProfileModel.toJson()}');

    if (response.isSuccess) {
      isSuccess = true;
      await AuthController.setUserData(createProfileModel);
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
