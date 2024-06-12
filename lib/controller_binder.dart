import 'package:ecommerce_project/presentation/state_holders/cart_controllers/add_to_cart_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/wish_list_controllers/add_to_wish_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/cart_controllers/cart_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/profile_controllers/create_profile_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/wish_list_controllers/get_wish_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_list_controllers/new_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_list_controllers/popular_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_list_controllers/product_list_by_category_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/profile_controllers/read_profile_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/review_controllers/create_review_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_list_controllers/special_products_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/email_otp_controllers/verify_email_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/email_otp_controllers/verify_otp_controller.dart';
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
    Get.put(AddToWishListController());
    Get.put(GetWishListController());
    Get.put(CartListController());
    Get.put(CreateReviewController());
  }
}
