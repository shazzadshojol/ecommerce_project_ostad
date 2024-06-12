import 'package:ecommerce_project/presentation/state_holders/cart_controllers/cart_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/widgets/cart_product_item.dart';
import 'package:ecommerce_project/presentation/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CartListController>().getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (_) {
          Get.find<MainBottomNavController>().backToHome();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cart', style: Theme.of(context).textTheme.titleMedium),
            leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: GetBuilder<CartListController>(builder: (cartListController) {
            if (cartListController.inProgress) {
              return const ProgressIndicatorCircular();
            }
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: cartListController.cartList.length,
                        itemBuilder: (context, index) {
                          return CartProductItem(
                            cartItem: cartListController.cartList[index],
                          );
                        })),
                _buildCheckout(cartListController.totalPrice)
              ],
            );
          }),
        ));
  }

  Widget _buildCheckout(double totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total price:',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.textColor),
              ),
              Text(
                '\$$totalPrice',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              )
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }
}
