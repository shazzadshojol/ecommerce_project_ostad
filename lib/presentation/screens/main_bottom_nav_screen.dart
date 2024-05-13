import 'package:ecommerce_project/presentation/screens/cart_list_scree.dart';
import 'package:ecommerce_project/presentation/screens/category_list_screen.dart';
import 'package:ecommerce_project/presentation/screens/home_screen.dart';
import 'package:ecommerce_project/presentation/screens/wish_list_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavController _mainBottomNavController =
      Get.find<MainBottomNavController>();

  List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavController>(
        builder: (_) {
          return _screens[_mainBottomNavController.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: _mainBottomNavController.selectedIndex,
          onTap: (index) => _mainBottomNavController.changeIndex(index),
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.gif_box_outlined), label: 'Wish'),
          ],
        );
      }),
    );
  }
}
