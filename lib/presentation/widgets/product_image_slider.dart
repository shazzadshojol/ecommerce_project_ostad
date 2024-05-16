import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildCarouselSlider(),
            Positioned(
              child: _buildDotIndicatorBuilder(),
              bottom: 8,
              left: 0,
              right: 0,
            )
          ],
        )
      ],
    );
  }

  Widget _buildDotIndicatorBuilder() {
    return ValueListenableBuilder(
        valueListenable: _valueNotifier,
        builder: (context, currentPage, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: i == currentPage
                          ? AppColors.primaryColor
                          : Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                )
            ],
          );
        });
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 220.0,
          viewportFraction: 1.02,
          onPageChanged: (index, _) {
            _valueNotifier.value = index;
          }),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  'text $i',
                  style: const TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}
