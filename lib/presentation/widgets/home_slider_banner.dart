import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/data/models/slider_data.dart';
import 'package:ecommerce_project/presentation/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/presentation/utility/app_colors.dart';
import 'package:ecommerce_project/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSliderBanner extends StatefulWidget {
  const HomeSliderBanner({
    super.key,
    required this.sliderList,
  });

  final List<CategoryListModels> sliderList;

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

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0,
          viewportFraction: 1.02,
          onPageChanged: (index, _) {
            _valueNotifier.value = index;
          }),
      items: widget.sliderList.map((sliderData) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: NetworkImageWidget(
                        url: sliderData.image ?? '',
                        height: double.maxFinite,
                        width: double.maxFinite,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                    _buildProductDescription(sliderData)
                  ],
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _buildProductDescription(CategoryListModels sliderData) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sliderData.title ?? '',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              sliderData.shortDes ?? '',
              maxLines: 3,
              style: const TextStyle(
                  color: Colors.black, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Get.to(() => const CompleteProfileScreen());
                },
                child: const Text('Buy now'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicatorBuilder() {
    return ValueListenableBuilder(
        valueListenable: _valueNotifier,
        builder: (context, currentPage, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.sliderList.length; i++)
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
}
