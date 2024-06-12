import 'package:ecommerce_project/data/models/wish_list_models/wish_list_item.dart';

class WishListModel {
  String? msg;
  List<WishListItem>? wishList;

  WishListModel({this.msg, this.wishList});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishList = <WishListItem>[];
      json['data'].forEach((v) {
        wishList!.add(WishListItem.fromJson(v));
      });
    }
  }
}
