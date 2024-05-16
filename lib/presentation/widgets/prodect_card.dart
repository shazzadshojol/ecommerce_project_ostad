import 'package:ecommerce_project/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/utility/image_path.dart';
import 'package:ecommerce_project/presentation/widgets/wish_or_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.showAddToWishList = true,
  });

  final bool showAddToWishList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetailsScreen());
      },
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 3,
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(ImagePath.footWere),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Nike sports shoe for your budget',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Wrap(
                      children: [
                        const Text('\$30',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor)),
                        const SizedBox(width: 8),
                        Wrap(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            const Text('3.4',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColor)),
                            const SizedBox(width: 8),
                            WishOrDeleteButton()
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
