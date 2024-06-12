import 'dart:developer';

import 'package:ecommerce_project/data/models/review_models/add_review_model.dart';
import 'package:ecommerce_project/data/models/review_models/create_review_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

class AddReviewController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = 'Review Updating Failed';
  AddReviewModel? addReviewModel;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getUserReview(AddReviewModel addReviewModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.readProductReview,
    );

    if (response.isSuccess) {
      this.addReviewModel = AddReviewModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
