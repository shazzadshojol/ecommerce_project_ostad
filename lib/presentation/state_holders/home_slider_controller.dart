import 'package:ecommerce_project/data/models/data_class/slider_data.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/slider_list_models.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart%20';

class HomeSliderController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<SliderData> _sliderList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<SliderData> get sliderList => _sliderList;

  Future<bool> getSlider() async {
    bool isSuccess = true;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.homeSlider);

    if (response.isSuccess) {
      _sliderList =
          SliderListModels.fromJson(response.responseData).sliderDataList ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
