import 'dart:developer';
import 'package:ecommerce_project/data/models/create_profile_data_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

import 'auth_controller.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = 'Read Profile Updating Failed';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> showUserDetails(CreateProfileModel createProfileModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.readProfile);
    log(Urls.readProfile.toString());
    if (response.isSuccess) {
      isSuccess = true;

      await AuthController.getUserData(createProfileModel);
      print('User data from read profile: $createProfileModel');
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
