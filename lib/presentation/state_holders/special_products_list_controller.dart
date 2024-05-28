import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/product_list_model.dart';
import 'package:ecommerce_project/data/models/product_models.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

class SpecialProductsListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<ProductModel> _specialProductList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<ProductModel> get specialProductList => _specialProductList;

  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListByRemarks('Special'));

    if (response.isSuccess) {
      _specialProductList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
