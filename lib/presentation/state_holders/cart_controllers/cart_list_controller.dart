import 'package:ecommerce_project/data/models/cart_models/cart_item-model.dart';
import 'package:ecommerce_project/data/models/cart_models/cart_list_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<CartItemModel> _cartList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<CartItemModel> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.getWishList);

    if (response.isSuccess) {
      isSuccess = true;
      _cartList = CartListModel.fromJson(response.responseData).cartList ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  double get totalPrice {
    double total = 0;
    for (CartItemModel cartItem in cartList) {
      total += (cartItem.qty!) *
          (double.tryParse(cartItem.product?.price ?? '0') ?? 0);
    }
    return total;
  }

  void changeProductQuantity(int cartId, int quantity) {
    _cartList.firstWhere((cartProduct) => cartProduct.id == cartId).qty =
        quantity;
    update();
  }

  void _deleteCartItem(int cartId) {
    _cartList.removeWhere((cartProduct) => cartProduct.id == cartId);
  }

  Future<bool> deleteItem(int cartId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.removeFromWishList(cartId));

    if (response.isSuccess) {
      _deleteCartItem(cartId);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
