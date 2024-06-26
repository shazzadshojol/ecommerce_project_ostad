import 'package:ecommerce_project/data/models/slider_models/slider_data.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/slider_models/slider_list_models.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<CategoryListModels> _sliderList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<CategoryListModels> get sliderList => _sliderList;

  Future<bool> getSlider() async {
    bool isSuccess = false;
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
