import 'package:ecommerce_project/data/models/product_details_model.dart';

class ProductDetailsWrapper {
  String? msg;
  List<ProductDetailsModel>? productDetails;

  ProductDetailsWrapper({this.msg, this.productDetails});

  ProductDetailsWrapper.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetails = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        productDetails!.add(ProductDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    if (this.productDetails != null) {
      data['data'] = this.productDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
