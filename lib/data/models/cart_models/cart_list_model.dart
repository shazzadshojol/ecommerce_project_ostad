import 'package:ecommerce_project/data/models/cart_models/cart_item-model.dart';

class CartListModel {
  String? msg;
  List<CartItemModel>? cartList;

  CartListModel({this.msg, this.cartList});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartList = <CartItemModel>[];
      json['data'].forEach((v) {
        cartList!.add(CartItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.cartList != null) {
      data['data'] = this.cartList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
