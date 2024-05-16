import 'package:ecommerce_project/presentation/screens/product_list_screen.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItemsList extends StatelessWidget {
  const CategoryItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Get.to(() => const ProductListScreen(categoryName: 'Electronics'));
        },
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(
              Icons.shop,
              size: 30,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Electronics',
            style: TextStyle(fontSize: 16, color: AppColors.primaryColor),
          )
        ]),
      ),
    );
  }
}
