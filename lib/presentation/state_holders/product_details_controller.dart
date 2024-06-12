import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/product_models/product_details_model.dart';
import 'package:ecommerce_project/data/models/product_models/product_details_wrapper.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.productDetails(productId));

    if (response.isSuccess) {
      if (_errorMessage.isNotEmpty) {
        _errorMessage = '';
      }

      _productDetailsModel =
          ProductDetailsWrapper.fromJson(response.responseData)
              .productDetails!
              .first;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
