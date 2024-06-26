import 'dart:developer';
import 'package:ecommerce_project/data/models/review_models/create_review_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = 'Review Updating Failed';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> saveUserReview(CreateReviewModel createReviewModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createProductReview,
      body: createReviewModel.toJson(),
    );

    log('Data sent: ${createReviewModel.toJson()}');
    log('Response: ${response.responseData}');

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
