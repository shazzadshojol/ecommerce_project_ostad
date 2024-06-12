import 'dart:developer';
import 'dart:ffi';
import 'package:ecommerce_project/data/models/create_profile_data_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

import '../auth_controller.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = 'Read Profile Updating Failed';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  var profileData = CreateProfileModel();

  Future<CreateProfileModel?> showUserDetails() async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.readProfile,
    );

    // CreateProfileModel? profileModel = CreateProfileModel();
    if (response.isSuccess) {
      final profileModel = CreateProfileModel.fromJson(response.responseData);
      // profileData.value = CreateProfileModel.fromJson(response.responseData);
      await AuthController.getUserData(profileModel);
      return profileModel;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return null;
  }
}
