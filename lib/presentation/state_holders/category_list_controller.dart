import 'package:ecommerce_project/data/models/category_model/category_list_model.dart';
import 'package:ecommerce_project/data/models/category_model/category_data.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<CategoryData> _categoryList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<CategoryData> get categoryList => _categoryList;

  Future<bool> getCategory() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.categoryList);

    if (response.isSuccess) {
      _categoryList = CategoryListModel.fromJson(response.responseData)
              .categoryListDataModels ??
          [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
