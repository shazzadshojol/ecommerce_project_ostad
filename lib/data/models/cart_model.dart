class CartModel {
  int? productId;
  String? color;
  String? size;
  int? qty;

  CartModel(
      {required this.productId,
      required this.color,
      required this.size,
      required this.qty});

  CartModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = productId;
    data['color'] = color;
    data['size'] = size;
    data['qty'] = qty;
    return data;
  }
}
