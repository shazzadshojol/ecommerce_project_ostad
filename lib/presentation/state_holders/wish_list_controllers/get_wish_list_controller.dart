import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/wish_list_models/wish_list_item.dart';
import 'package:ecommerce_project/data/models/wish_list_models/wish_list_model.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

class GetWishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<WishListItem> _wishList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<WishListItem> get wishList => _wishList;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.getWishList);

    if (response.isSuccess) {
      isSuccess = true;
      _wishList = WishListModel.fromJson(response.responseData).wishList ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
