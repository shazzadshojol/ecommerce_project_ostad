import 'package:ecommerce_project/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/create_profile_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/new_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/popular_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/read_profile_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/special_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/verify_email_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductListByCategoryController());
    Get.put(NewProductsListController());
    Get.put(PopularProductsListController());
    Get.put(SpecialProductsListController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(VerifyEmailController());
    Get.put(VerifyOtpController());
    Get.put(CreateProfileController());
    Get.put(ReadProfileController());
  }
}
