import 'package:ecommerce_project/presentation/screens/reviews_screen.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/widgets/cart_increment_decrement.dart';
import 'package:ecommerce_project/presentation/widgets/color_picker.dart';
import 'package:ecommerce_project/presentation/widgets/product_image_slider.dart';
import 'package:ecommerce_project/presentation/widgets/size_picker.dart';
import 'package:ecommerce_project/presentation/widgets/wish_or_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Nike UltraComfort Running Shoes',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            const CartIncrementDecrement()
                          ],
                        ),
                        buildReviewsSection(),
                        const SizedBox(height: 10),
                        Text(
                          'Color',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        ColorPicker(
                          colors: const [
                            Colors.black87,
                            Colors.redAccent,
                            Colors.blue,
                            Colors.green,
                          ],
                          onChange: (Color selectedColor) {},
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Size',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        SizePicker(sizes: [
                          'S',
                          'M',
                          'L',
                          'XL',
                        ], onChange: (String s) {}),
                        const SizedBox(height: 10),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        const Text('''
              
              Weight: 250 grams per shoe
              Upper Material: Breathable mesh
              Midsole: EVA foam
              Outsole: High-traction rubber
              Insole: Memory foam
              Available Sizes: US 5-13 (Men's and Women's)
              Colors: Black, White, Red, Blue, Green, and Purple
                      
               ''')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _buildCheckout()
        ],
      ),
    );
  }

  Widget buildReviewsSection() {
    return Wrap(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,
          spacing: 5,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const Text('3.4',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor)),
            const SizedBox(width: 8),
            TextButton(
                onPressed: () {
                  Get.to(() => const ReviewsScreen());
                },
                child: const Text('Reviews')),
            const WishOrDeleteButton(),
          ],
        )
      ],
    );
  }

  Widget _buildCheckout() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total price:',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.textColor),
              ),
              Text(
                '\$1000',
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
              child: const Text('Add to cart'),
            ),
          )
        ],
      ),
    );
  }
}
