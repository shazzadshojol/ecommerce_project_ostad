import 'package:ecommerce_project/data/models/category_model/category_data.dart';

class CategoryListModel {
  String? msg;
  List<CategoryData>? categoryListDataModels;

  CategoryListModel({this.msg, this.categoryListDataModels});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryListDataModels = <CategoryData>[];
      json['data'].forEach((v) {
        categoryListDataModels!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    if (categoryListDataModels != null) {
      data['data'] = categoryListDataModels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
