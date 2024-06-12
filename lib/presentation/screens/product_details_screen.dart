import 'package:ecommerce_project/data/models/cart_models/cart_model.dart';
import 'package:ecommerce_project/data/models/product_models/product_details_model.dart';
import 'package:ecommerce_project/presentation/screens/reviews_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/cart_controllers/add_to_cart_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/wish_list_controllers/add_to_wish_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/utility/snack_message.dart';
import 'package:ecommerce_project/presentation/widgets/cart_increment_decrement.dart';
import 'package:ecommerce_project/presentation/widgets/product_image_slider.dart';
import 'package:ecommerce_project/presentation/widgets/progress_indicator.dart';
import 'package:ecommerce_project/presentation/widgets/size_picker.dart';
import 'package:ecommerce_project/presentation/widgets/wish_or_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final int _cartCounter = 1;
  late String _selectColor;
  late String _selectSize;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const ProgressIndicatorCircular();
        }

        if (productDetailsController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(productDetailsController.errorMessage),
          );
        }

        ProductDetailsModel productDetailsModel =
            productDetailsController.productDetailsModel;

        List<String> size = productDetailsModel.size?.split(',') ?? [];
        List<String> color = productDetailsModel.color?.split(',') ?? [];

        _selectColor = color.first;
        _selectSize = size.first;

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageSlider(
                      image: [
                        productDetailsModel.img1 ?? '',
                        productDetailsModel.img2 ?? '',
                        productDetailsModel.img3 ?? '',
                        productDetailsModel.img4 ?? '',
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  productDetailsModel.product?.title ?? '',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              const CartIncrementDecrement()
                            ],
                          ),
                          buildReviewsSection(productDetailsModel),
                          const SizedBox(height: 10),
                          Text(
                            'Color',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          SizePicker(
                            sizes: color,
                            onChange: (String s) {
                              _selectColor = s;
                            },
                            isRounded: false,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Size',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          SizePicker(
                            sizes: size,
                            onChange: (String s) {
                              _selectSize = s;
                            },
                            isRounded: true,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          Text(productDetailsModel.product?.shortDes ?? ''),
                          const SizedBox(height: 10),
                          Text(productDetailsModel.des ?? ''),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            _buildAddToCartSection(productDetailsModel)
          ],
        );
      }),
    );
  }

  Widget buildReviewsSection(ProductDetailsModel productDetailsModel) {
    return Wrap(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,
          spacing: 5,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            Text('${productDetailsModel.product?.star ?? ''}',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor)),
            const SizedBox(width: 8),
            TextButton(
                onPressed: () {
                  Get.to(() => const ReviewsScreen());
                },
                child: const Text('Reviews')),
            GetBuilder<AddToWishListController>(
                builder: (addToWishListController) {
              if (addToWishListController.inProgress) {
                return Transform.scale(
                    scale: 0.4, child: const CircularProgressIndicator());
              }

              return WishOrDeleteButton(
                showAddToWishList: true,
                isSelected: true,
                onTap: () {
                  addToWishListController.addToWishList(widget.productId);
                },
              );
            }),
          ],
        )
      ],
    );
  }

  Widget _buildAddToCartSection(ProductDetailsModel productDetailsModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPrice(productDetailsModel),
          SizedBox(
            width: 120,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              if (addToCartController.inProgress) {
                return const ProgressIndicatorCircular();
              }

              return ElevatedButton(
                onPressed: () {
                  CartModel cartModel = CartModel(
                      productId: widget.productId,
                      color: _selectColor,
                      size: _selectSize,
                      qty: _cartCounter);
                  addToCartController.addToCart(cartModel).then((result) {
                    if (result) {
                      showSnackMessage(context, 'Success add to cart');
                    } else {
                      showSnackMessage(
                          context, addToCartController.errorMessage);
                    }
                  });
                },
                child: const Text('Add to cart'),
              );
            }),
          )
        ],
      ),
    );
  }

  Column _buildPrice(ProductDetailsModel productDetailsModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Total price:',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.textColor),
        ),
        Text(
          '\$${productDetailsModel.product?.price ?? 0}',
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor),
        )
      ],
    );
  }
}
