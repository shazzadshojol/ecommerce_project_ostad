import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSliderBanner extends StatefulWidget {
  const HomeSliderBanner({
    super.key,
  });

  @override
  State<HomeSliderBanner> createState() => _HomeSliderBannerState();
}

class _HomeSliderBannerState extends State<HomeSliderBanner> {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        const SizedBox(height: 16),
        _buildDotIndicatorBuilder()
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
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: i == currentPage ? AppColors.primaryColor : null,
                      border: Border.all(color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(50)),
                )
            ],
          );
        });
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0,
          viewportFraction: 1.02,
          onPageChanged: (index, _) {
            _valueNotifier.value = index;
          }),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
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
