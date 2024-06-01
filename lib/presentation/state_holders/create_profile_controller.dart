import 'package:ecommerce_project/data/models/cart_model.dart';
import 'package:ecommerce_project/data/models/create_profile_data_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

class CreateProfileController extends GetxController {
  bool _inProgress = true;
  String _errorMessage = 'Profile Updating Failed';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> saveUserDetails(CreateProfileModel createProfileModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> textFieldDataFromController = {
      "cus_name": createProfileModel.cusName,
      "cus_add": createProfileModel.cusAdd,
      "cus_city": createProfileModel.cusCity,
      "cus_state": createProfileModel.cusState,
      "cus_postcode": createProfileModel.cusPostcode,
      "cus_country": createProfileModel.cusCountry,
      "cus_phone": createProfileModel.cusPhone,
      "cus_fax": createProfileModel.cusFax,
      "ship_name": createProfileModel.shipName,
      "ship_add": createProfileModel.shipAdd,
      "ship_city": createProfileModel.shipCity,
      "ship_state": createProfileModel.shipState,
      "ship_postcode": createProfileModel.shipPostcode,
      "ship_country": createProfileModel.shipCountry,
      "ship_phone": createProfileModel.shipPhone
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.createProfile, body: createProfileModel.toJson());

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
