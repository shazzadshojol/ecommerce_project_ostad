import 'package:ecommerce_project/presentation/state_holders/wish_list_controllers/get_wish_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce_project/presentation/widgets/product_card.dart';
import 'package:ecommerce_project/presentation/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    super.key,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<GetWishListController>().getWishList();
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
          title: const Text('Wish List'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body:
            GetBuilder<GetWishListController>(builder: (getWishListController) {
          if (getWishListController.inProgress) {
            return const ProgressIndicatorCircular();
          }
          return RefreshIndicator(
            onRefresh: () async {
              getWishListController.getWishList();
            },
            child: GridView.builder(
                itemCount: getWishListController.wishList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                      showAddToWishList: false,
                      product: getWishListController.wishList[index].product!,
                    ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
