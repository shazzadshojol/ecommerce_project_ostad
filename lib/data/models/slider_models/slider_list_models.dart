import 'package:ecommerce_project/data/models/slider_models/slider_data.dart';

class SliderListModels {
  String? msg;
  List<CategoryListModels>? sliderDataList;

  SliderListModels({this.msg, this.sliderDataList});

  SliderListModels.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderDataList = <CategoryListModels>[];
      json['data'].forEach((v) {
        sliderDataList!.add(CategoryListModels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    if (sliderDataList != null) {
      data['data'] = sliderDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
