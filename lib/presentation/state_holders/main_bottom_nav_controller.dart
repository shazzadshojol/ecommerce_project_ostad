import 'package:ecommerce_project/presentation/screens/email_verify_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  Future<void> changeIndex(int index) async {
    if (index == 2 || index == 3) {
      final isLoggedIn = await AuthController.checkLoggedState();
      if (!isLoggedIn) {
        Get.to(() => const EmailVerifyScreen());
        return;
      }
    }
    _selectedIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }

  void selectCategory() {
    changeIndex(1);
  }
}
