import 'package:ecommerce_project/data/models/product_models/product_models.dart';

class CartItemModel {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  int? qty = 1;
  String? price;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  CartItemModel(
      {this.id,
      this.userId,
      this.productId,
      this.color,
      this.size,
      this.qty,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.product});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = int.tryParse(json['qty']) ?? 1;
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null
        ? new ProductModel.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['color'] = this.color;
    data['size'] = this.size;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
