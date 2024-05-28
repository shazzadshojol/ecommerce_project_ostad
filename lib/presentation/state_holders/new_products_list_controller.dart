import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/product_list_model.dart';
import 'package:ecommerce_project/data/models/product_models.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

class NewProductsListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<ProductModel> _newProductList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<ProductModel> get newProductList => _newProductList;

  Future<bool> getNewProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.productListByRemarks('New'));

    if (response.isSuccess) {
      _newProductList =
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
