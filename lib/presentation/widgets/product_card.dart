import 'package:ecommerce_project/data/models/product_models/product_models.dart';
import 'package:ecommerce_project/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/widgets/wish_or_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.showAddToWishList = true,
    required this.product,
  });

  final bool showAddToWishList;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
              productId: product.id!,
            ));
      },
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 3,
        child: SizedBox(
          width: 200,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                width: double.maxFinite,
                child: Image.network(product.image ?? ''),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Wrap(
                      children: [
                        Text('\$${product.price}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor)),
                        const SizedBox(width: 8),
                        Wrap(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text('${product.star}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColor)),
                            const SizedBox(width: 8),
                            // WishOrDeleteButton(showAddToWishList: false,onTap: () {  },)
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
