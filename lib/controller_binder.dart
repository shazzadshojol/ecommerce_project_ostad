import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainBottomNavController());
  }
}
