class CreateReviewModel {
  String? description;
  int? productId;
  int? rating;
  String? firstName;
  String? lastName;

  CreateReviewModel(
      {this.description,
      this.productId,
      this.rating,
      this.firstName,
      this.lastName});

  CreateReviewModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    productId = json['product_id'];
    rating = json['rating'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['description'] = description;
    data['product_id'] = productId;
    data['rating'] = rating;
    data['first_name'] = description;
    data['last_name'] = description;
    return data;
  }
}
