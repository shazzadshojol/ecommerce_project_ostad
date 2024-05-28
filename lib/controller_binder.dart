import 'package:ecommerce_project/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/new_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/popular_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/special_products_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainBottomNavController());
    Get.lazyPut(() => HomeSliderController());
    Get.lazyPut(() => CategoryListController());
    Get.lazyPut(() => ProductListByCategoryController());
    Get.lazyPut(() => NewProductsListController());
    Get.lazyPut(() => PopularProductsListController());
    Get.lazyPut(() => SpecialProductsListController());
    Get.lazyPut(() => ProductDetailsController());
  }
}
