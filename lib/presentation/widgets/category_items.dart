import 'package:ecommerce_project/data/models/category_model/category_data.dart';
import 'package:ecommerce_project/presentation/screens/product_list_screen.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItemsList extends StatelessWidget {
  const CategoryItemsList({
    super.key,
    required this.categoryData,
  });

  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductListScreen(
                categoryName: categoryData.categoryName ?? '',
                categoryId: categoryData.id!,
              ));
        },
        child: Column(children: [
          ClipOval(
            child: NetworkImageWidget(
              url: categoryData.categoryImg ?? '',
              height: 40,
              width: 40,
              boxFit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categoryData.categoryName ?? '',
            style: const TextStyle(fontSize: 12, color: AppColors.primaryColor),
          )
        ]),
      ),
    );
  }
}
