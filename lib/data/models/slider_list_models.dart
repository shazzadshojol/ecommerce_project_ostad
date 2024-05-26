import 'package:ecommerce_project/data/models/data_class/slider_data.dart';

class SliderListModels {
  String? msg;
  List<SliderData>? sliderDataList;

  SliderListModels({this.msg, this.sliderDataList});

  SliderListModels.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderDataList = <SliderData>[];
      json['data'].forEach((v) {
        sliderDataList!.add(SliderData.fromJson(v));
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
