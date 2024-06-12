import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/product_models/product_list_model.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductListByCategoryController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List _productList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List get productList => _productList;

  Future<bool> getProductList(int categoryId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListCategory(categoryId));

    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
